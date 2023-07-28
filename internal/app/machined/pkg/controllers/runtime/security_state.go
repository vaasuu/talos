// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

package runtime

import (
	"bytes"
	"context"
	"crypto/sha256"
	"crypto/x509"
	"encoding/hex"
	"encoding/pem"
	"fmt"
	"os"
	"strings"

	"github.com/cosi-project/runtime/pkg/controller"
	"github.com/cosi-project/runtime/pkg/safe"
	"github.com/foxboron/go-uefi/efi"
	"go.uber.org/zap"

	"github.com/siderolabs/talos/pkg/machinery/constants"
	runtimeres "github.com/siderolabs/talos/pkg/machinery/resources/runtime"
)

// SecurityStateController is a controller that updates the security state of Talos.
type SecurityStateController struct{}

// Name implements controller.Controller interface.
func (ctrl *SecurityStateController) Name() string {
	return "runtime.SecurityStateController"
}

// Inputs implements controller.Controller interface.
func (ctrl *SecurityStateController) Inputs() []controller.Input {
	return nil
}

// Outputs implements controller.Controller interface.
func (ctrl *SecurityStateController) Outputs() []controller.Output {
	return []controller.Output{
		{
			Type: runtimeres.SecurityStateType,
			Kind: controller.OutputExclusive,
		},
	}
}

// Run implements controller.Controller interface.
// nolint:gocyclo
func (ctrl *SecurityStateController) Run(ctx context.Context, r controller.Runtime, logger *zap.Logger) error {
	select {
	case <-ctx.Done():
		return nil
	case <-r.EventCh():
	}

	var secureBootState bool

	if efi.GetSecureBoot() && !efi.GetSetupMode() {
		secureBootState = true
	}

	if err := safe.WriterModify(ctx, r, runtimeres.NewSecurityStateSpec(runtimeres.NamespaceName), func(state *runtimeres.SecurityState) error {
		state.TypedSpec().SecureBoot = secureBootState

		return nil
	}); err != nil {
		return err
	}

	if pcrPublicKeyData, err := os.ReadFile(constants.PCRPublicKey); err == nil {
		block, _ := pem.Decode(pcrPublicKeyData)
		if block == nil {
			return fmt.Errorf("failed to decode PEM block for PCR public key")
		}

		cert := x509.Certificate{
			Raw: block.Bytes,
		}

		if err := safe.WriterModify(ctx, r, runtimeres.NewSecurityStateSpec(runtimeres.NamespaceName), func(state *runtimeres.SecurityState) error {
			state.TypedSpec().PCRSigningKeyFingerprint = x509CertFingerprint(cert)

			return nil
		}); err != nil {
			return err
		}
	}

	// terminating the controller here, as we need to only populate securitystate once
	return nil
}

func x509CertFingerprint(cert x509.Certificate) string {
	hash := sha256.Sum256(cert.Raw)

	var buf bytes.Buffer

	for i, b := range hex.EncodeToString(hash[:]) {
		if i > 0 && i%2 == 0 {
			buf.WriteByte(':')
		}

		buf.WriteString(strings.ToUpper(string(b)))
	}

	return buf.String()
}

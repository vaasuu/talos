module github.com/siderolabs/talos

go 1.23.3

replace (
	// see e.g. https://github.com/grpc/grpc-go/issues/6696
	cloud.google.com/go => cloud.google.com/go v0.100.2

	// forked coredns so we don't carry caddy and other stuff into the Talos
	github.com/coredns/coredns => github.com/siderolabs/coredns v1.12.50

	// see https://github.com/mdlayher/kobject/pull/5
	github.com/mdlayher/kobject => github.com/smira/kobject v0.0.0-20240304111826-49c8d4613389

	// Use nested module.
	github.com/siderolabs/talos/pkg/machinery => ./pkg/machinery

	// see https://github.com/siderolabs/talos/issues/8514
	golang.zx2c4.com/wireguard => github.com/siderolabs/wireguard-go v0.0.0-20240401105714-9c7067e9d4b9

	// see https://github.com/siderolabs/talos/issues/8514
	golang.zx2c4.com/wireguard/wgctrl => github.com/siderolabs/wgctrl-go v0.0.0-20240401105613-579af3342774

	// forked go-yaml that introduces RawYAML interface, which can be used to populate YAML fields using bytes
	// which are then encoded as a valid YAML blocks with proper indentiation
	gopkg.in/yaml.v3 => github.com/unix4ever/yaml v0.0.0-20220527175918-f17b0f05cf2c
)

// fd-leak related replacements: https://github.com/siderolabs/talos/issues/9412
// https://github.com/insomniacslk/dhcp/pull/550
replace github.com/insomniacslk/dhcp => github.com/smira/dhcp v0.0.0-20241001122726-31e9ef21c016

// Kubernetes dependencies sharing the same version.
require (
	k8s.io/api v0.32.1
	k8s.io/apimachinery v0.32.1
	k8s.io/apiserver v0.32.1
	k8s.io/client-go v0.32.1
	k8s.io/component-base v0.32.1
	k8s.io/cri-api v0.32.1
	k8s.io/kube-scheduler v0.32.1
	k8s.io/kubectl v0.32.1
	k8s.io/kubelet v0.32.1
	k8s.io/pod-security-admission v0.32.1
)

require (
	cloud.google.com/go/compute/metadata v0.6.0
	github.com/Azure/azure-sdk-for-go/sdk/azcore v1.16.0
	github.com/Azure/azure-sdk-for-go/sdk/azidentity v1.8.0
	github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azcertificates v1.3.0
	github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys v1.3.0
	github.com/alexflint/go-filemutex v1.3.0
	github.com/aws/aws-sdk-go-v2/config v1.28.7
	github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.16.22
	github.com/aws/aws-sdk-go-v2/service/kms v1.37.8
	github.com/aws/smithy-go v1.22.1
	github.com/beevik/ntp v1.4.3
	github.com/benbjohnson/clock v1.3.5 // project archived on 2023-05-18
	github.com/blang/semver/v4 v4.0.0
	github.com/cenkalti/backoff/v4 v4.3.0
	github.com/containerd/cgroups/v3 v3.0.5
	github.com/containerd/containerd/api v1.8.0
	github.com/containerd/containerd/v2 v2.0.2
	github.com/containerd/errdefs v1.0.0
	github.com/containerd/log v0.1.0
	github.com/containerd/platforms v1.0.0-rc.1
	github.com/containerd/typeurl/v2 v2.2.3
	github.com/containernetworking/cni v1.2.3
	github.com/containernetworking/plugins v1.6.1
	github.com/coredns/coredns v1.11.3
	github.com/coreos/go-iptables v0.8.0
	github.com/cosi-project/runtime v0.8.1
	github.com/distribution/reference v0.6.0
	github.com/docker/cli v27.4.1+incompatible
	github.com/docker/docker v27.4.1+incompatible
	github.com/docker/go-connections v0.5.0
	github.com/dustin/go-humanize v1.0.1
	github.com/ecks/uefi v0.0.0-20221116212947-caef65d070eb
	github.com/elastic/go-libaudit/v2 v2.6.1
	github.com/fatih/color v1.18.0
	github.com/florianl/go-tc v0.4.4
	github.com/foxboron/go-uefi v0.0.0-20241219185318-19dc140271bf
	github.com/freddierice/go-losetup/v2 v2.0.1
	github.com/fsnotify/fsnotify v1.8.0
	github.com/gdamore/tcell/v2 v2.7.4
	github.com/gertd/go-pluralize v0.2.1
	github.com/gizak/termui/v3 v3.1.0
	github.com/godbus/dbus/v5 v5.1.0
	github.com/golang/mock v1.6.0
	github.com/google/cadvisor v0.51.0
	github.com/google/cel-go v0.22.1
	github.com/google/go-containerregistry v0.20.2
	github.com/google/go-tpm v0.9.3
	github.com/google/nftables v0.2.0
	github.com/google/uuid v1.6.0
	github.com/gopacket/gopacket v1.3.1
	github.com/gosuri/uiprogress v0.0.1
	github.com/grpc-ecosystem/go-grpc-middleware/v2 v2.2.0
	github.com/hashicorp/go-cleanhttp v0.5.2
	github.com/hashicorp/go-envparse v0.1.0
	github.com/hashicorp/go-getter/v2 v2.2.3
	github.com/hashicorp/go-multierror v1.1.1
	github.com/hetznercloud/hcloud-go/v2 v2.17.1
	github.com/insomniacslk/dhcp v0.0.0-20240829085014-a3a4c1f04475
	github.com/jeromer/syslogparser v1.1.0
	github.com/jsimonetti/rtnetlink/v2 v2.0.3-0.20241216183107-2d6e9f8ad3f2
	github.com/jxskiss/base62 v1.1.0
	github.com/klauspost/compress v1.17.11
	github.com/klauspost/cpuid/v2 v2.2.9
	github.com/linode/go-metadata v0.2.1
	github.com/martinlindhe/base36 v1.1.1
	github.com/mattn/go-isatty v0.0.20
	github.com/mdlayher/arp v0.0.0-20220512170110-6706a2966875
	github.com/mdlayher/ethtool v0.2.0
	github.com/mdlayher/genetlink v1.3.2
	github.com/mdlayher/kobject v0.0.0-20200520190114-19ca17470d7d
	github.com/mdlayher/netlink v1.7.2
	github.com/mdlayher/netx v0.0.0-20230430222610-7e21880baee8
	github.com/mdp/qrterminal/v3 v3.2.0
	github.com/miekg/dns v1.1.62
	github.com/nberlee/go-netstat v0.1.2
	github.com/opencontainers/go-digest v1.0.0
	github.com/opencontainers/image-spec v1.1.0
	github.com/opencontainers/runc v1.2.4
	github.com/opencontainers/runtime-spec v1.2.0
	github.com/packethost/packngo v0.31.0
	github.com/pelletier/go-toml/v2 v2.2.3
	github.com/pin/tftp/v3 v3.1.0
	github.com/pkg/xattr v0.4.10
	github.com/pmorjan/kmod v1.1.1
	github.com/prometheus/procfs v0.15.1
	github.com/rivo/tview v0.0.0-20241103174730-c76f7879f592
	github.com/rs/xid v1.6.0
	github.com/ryanuber/columnize v2.1.2+incompatible
	github.com/ryanuber/go-glob v1.0.0
	github.com/safchain/ethtool v0.5.9
	github.com/scaleway/scaleway-sdk-go v1.0.0-beta.30
	github.com/siderolabs/crypto v0.5.1
	github.com/siderolabs/discovery-api v0.1.5
	github.com/siderolabs/discovery-client v0.1.10
	github.com/siderolabs/gen v0.8.0
	github.com/siderolabs/go-api-signature v0.3.6
	github.com/siderolabs/go-blockdevice v0.4.8
	github.com/siderolabs/go-blockdevice/v2 v2.0.13
	github.com/siderolabs/go-circular v0.2.1
	github.com/siderolabs/go-cmd v0.1.3
	github.com/siderolabs/go-copy v0.1.0
	github.com/siderolabs/go-debug v0.4.0
	github.com/siderolabs/go-kmsg v0.1.4
	github.com/siderolabs/go-kubeconfig v0.1.0
	github.com/siderolabs/go-kubernetes v0.2.17
	github.com/siderolabs/go-loadbalancer v0.3.4
	github.com/siderolabs/go-pcidb v0.3.0
	github.com/siderolabs/go-pointer v1.0.0
	github.com/siderolabs/go-procfs v0.1.2
	github.com/siderolabs/go-retry v0.3.3
	github.com/siderolabs/go-smbios v0.3.3
	github.com/siderolabs/go-tail v0.1.1
	github.com/siderolabs/go-talos-support v0.1.2
	github.com/siderolabs/grpc-proxy v0.5.1
	github.com/siderolabs/kms-client v0.1.0
	github.com/siderolabs/net v0.4.0
	github.com/siderolabs/proto-codec v0.1.1
	github.com/siderolabs/siderolink v0.3.11
	github.com/siderolabs/talos/pkg/machinery v1.10.0-alpha.0
	github.com/sirupsen/logrus v1.9.3
	github.com/spf13/cobra v1.8.1
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.10.0
	github.com/thejerf/suture/v4 v4.0.6
	github.com/u-root/u-root v0.14.0
	github.com/ulikunitz/xz v0.5.12
	github.com/vmware/vmw-guestinfo v0.0.0-20220317130741-510905f0efa3
	github.com/vultr/metadata v1.1.0
	go.etcd.io/etcd/api/v3 v3.5.17
	go.etcd.io/etcd/client/pkg/v3 v3.5.17
	go.etcd.io/etcd/client/v3 v3.5.17
	go.etcd.io/etcd/etcdutl/v3 v3.5.17
	go.uber.org/zap v1.27.0
	go4.org/netipx v0.0.0-20231129151722-fdeea329fbba
	golang.org/x/net v0.33.0
	golang.org/x/oauth2 v0.24.0
	golang.org/x/sync v0.10.0
	golang.org/x/sys v0.28.0
	golang.org/x/term v0.27.0
	golang.org/x/text v0.21.0
	golang.org/x/time v0.8.0
	golang.zx2c4.com/wireguard/wgctrl v0.0.0-20230429144221-925a1e7659e6
	google.golang.org/grpc v1.69.2
	google.golang.org/protobuf v1.36.1
	gopkg.in/yaml.v3 v3.0.1
	k8s.io/klog/v2 v2.130.1
	kernel.org/pub/linux/libs/security/libcap/cap v1.2.73
	sigs.k8s.io/hydrophone v0.6.1-0.20240718103601-b92baf7e0b04
	sigs.k8s.io/yaml v1.4.0
)

require (
	cel.dev/expr v0.18.0 // indirect
	github.com/0x5a17ed/itkit v0.6.0 // indirect
	github.com/AdaLogics/go-fuzz-headers v0.0.0-20240806141605-e8a1dd7889d6 // indirect
	github.com/AdamKorcz/go-118-fuzz-build v0.0.0-20231105174938-2b5cbb29f3e2 // indirect
	github.com/Azure/azure-sdk-for-go/sdk/internal v1.10.0 // indirect
	github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal v1.1.0 // indirect
	github.com/Azure/go-ansiterm v0.0.0-20230124172434-306776ec8161 // indirect
	github.com/AzureAD/microsoft-authentication-library-for-go v1.3.1 // indirect
	github.com/MakeNowJust/heredoc v1.0.0 // indirect
	github.com/Microsoft/go-winio v0.6.2 // indirect
	github.com/Microsoft/hcsshim v0.12.9 // indirect
	github.com/ProtonMail/go-crypto v1.1.3 // indirect
	github.com/ProtonMail/go-mime v0.0.0-20230322103455-7d82a3887f2f // indirect
	github.com/ProtonMail/gopenpgp/v2 v2.8.1 // indirect
	github.com/adrg/xdg v0.5.3 // indirect
	github.com/antlr4-go/antlr/v4 v4.13.1 // indirect
	github.com/apparentlymart/go-cidr v1.1.0 // indirect
	github.com/armon/circbuf v0.0.0-20190214190532-5111143e8da2 // indirect
	github.com/aws/aws-sdk-go-v2 v1.32.7 // indirect
	github.com/aws/aws-sdk-go-v2/credentials v1.17.48 // indirect
	github.com/aws/aws-sdk-go-v2/internal/configsources v1.3.26 // indirect
	github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.6.26 // indirect
	github.com/aws/aws-sdk-go-v2/internal/ini v1.8.1 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.12.1 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.12.7 // indirect
	github.com/aws/aws-sdk-go-v2/service/sso v1.24.8 // indirect
	github.com/aws/aws-sdk-go-v2/service/ssooidc v1.28.7 // indirect
	github.com/aws/aws-sdk-go-v2/service/sts v1.33.3 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/bgentry/go-netrc v0.0.0-20140422174119-9fd32a8b3d3d // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/chai2010/gettext-go v1.0.2 // indirect
	github.com/cilium/ebpf v0.16.0 // indirect
	github.com/cloudflare/circl v1.5.0 // indirect
	github.com/containerd/continuity v0.4.4 // indirect
	github.com/containerd/errdefs/pkg v0.3.0 // indirect
	github.com/containerd/fifo v1.1.0 // indirect
	github.com/containerd/go-cni v1.1.11 // indirect
	github.com/containerd/plugin v1.0.0 // indirect
	github.com/containerd/stargz-snapshotter/estargz v0.14.3 // indirect
	github.com/containerd/ttrpc v1.2.7 // indirect
	github.com/coreos/go-semver v0.3.1 // indirect
	github.com/coreos/go-systemd/v22 v22.5.0 // indirect
	github.com/cpuguy83/go-md2man/v2 v2.0.5 // indirect
	github.com/cyphar/filepath-securejoin v0.3.5 // indirect
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/docker/distribution v2.8.3+incompatible // indirect
	github.com/docker/docker-credential-helpers v0.7.0 // indirect
	github.com/docker/go-units v0.5.0 // indirect
	github.com/emicklei/dot v1.6.4 // indirect
	github.com/emicklei/go-restful/v3 v3.11.2 // indirect
	github.com/evanphx/json-patch v5.9.0+incompatible // indirect
	github.com/exponent-io/jsonpath v0.0.0-20210407135951-1de76d718b3f // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/fxamacker/cbor/v2 v2.7.0 // indirect
	github.com/gdamore/encoding v1.0.0 // indirect
	github.com/ghodss/yaml v1.0.0 // indirect
	github.com/go-errors/errors v1.4.2 // indirect
	github.com/go-logr/logr v1.4.2 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/go-openapi/jsonpointer v0.21.0 // indirect
	github.com/go-openapi/jsonreference v0.20.4 // indirect
	github.com/go-openapi/swag v0.23.0 // indirect
	github.com/go-resty/resty/v2 v2.15.3 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang-jwt/jwt/v4 v4.5.1 // indirect
	github.com/golang-jwt/jwt/v5 v5.2.1 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/google/btree v1.1.2 // indirect
	github.com/google/gnostic-models v0.6.8 // indirect
	github.com/google/go-cmp v0.6.0 // indirect
	github.com/google/gofuzz v1.2.0 // indirect
	github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510 // indirect
	github.com/gorilla/websocket v1.5.1 // indirect
	github.com/gosuri/uilive v0.0.4 // indirect
	github.com/gregjones/httpcache v0.0.0-20190611155906-901d90724c79 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.24.0 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-safetemp v1.0.0 // indirect
	github.com/hashicorp/go-version v1.6.0 // indirect
	github.com/hexops/gotextdiff v1.0.3 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/jonboulle/clockwork v0.4.0 // indirect
	github.com/josharian/intern v1.0.0 // indirect
	github.com/josharian/native v1.1.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/kylelemons/godebug v1.1.0 // indirect
	github.com/liggitt/tabwriter v0.0.0-20181228230101-89fcab3d43de // indirect
	github.com/lmittmann/tint v1.0.4 // indirect
	github.com/lucasb-eyer/go-colorful v1.2.0 // indirect
	github.com/mailru/easyjson v0.7.7 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-runewidth v0.0.15 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.4 // indirect
	github.com/mdlayher/ethernet v0.0.0-20220221185849-529eae5b6118 // indirect
	github.com/mdlayher/packet v1.1.2 // indirect
	github.com/mdlayher/socket v0.5.1 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/mitchellh/go-testing-interface v1.14.1 // indirect
	github.com/mitchellh/go-wordwrap v1.0.1 // indirect
	github.com/moby/docker-image-spec v1.3.1 // indirect
	github.com/moby/locker v1.0.1 // indirect
	github.com/moby/spdystream v0.5.0 // indirect
	github.com/moby/sys/mountinfo v0.7.2 // indirect
	github.com/moby/sys/sequential v0.6.0 // indirect
	github.com/moby/sys/signal v0.7.1 // indirect
	github.com/moby/sys/user v0.3.0 // indirect
	github.com/moby/sys/userns v0.1.0 // indirect
	github.com/moby/term v0.5.0 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/monochromegane/go-gitignore v0.0.0-20200626010858-205db1a8cc00 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/mxk/go-flowrate v0.0.0-20140419014527-cca7078d478f // indirect
	github.com/nsf/termbox-go v0.0.0-20190121233118-02980233997d // indirect
	github.com/opencontainers/runtime-tools v0.9.1-0.20221107090550-2e043c6bd626 // indirect
	github.com/opencontainers/selinux v1.11.1 // indirect
	github.com/opentracing/opentracing-go v1.2.0 // indirect
	github.com/peterbourgon/diskv v2.0.1+incompatible // indirect
	github.com/pierrec/lz4/v4 v4.1.21 // indirect
	github.com/pkg/browser v0.0.0-20240102092130-5ac0b6a4141c // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/planetscale/vtprotobuf v0.6.1-0.20241121165744-79df5c4772f2 // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/prometheus/client_golang v1.20.5 // indirect
	github.com/prometheus/client_model v0.6.1 // indirect
	github.com/prometheus/common v0.60.1 // indirect
	github.com/rivo/uniseg v0.4.7 // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/siderolabs/protoenc v0.2.1 // indirect
	github.com/siderolabs/tcpproxy v0.1.0 // indirect
	github.com/spf13/afero v1.10.0 // indirect
	github.com/stoewer/go-strcase v1.3.0 // indirect
	github.com/syndtr/gocapability v0.0.0-20200815063812-42c35b437635 // indirect
	github.com/u-root/uio v0.0.0-20240224005618-d2acac8f3701 // indirect
	github.com/vbatts/tar-split v0.11.3 // indirect
	github.com/vishvananda/netlink v1.3.0 // indirect
	github.com/vishvananda/netns v0.0.4 // indirect
	github.com/x448/float16 v0.8.4 // indirect
	github.com/xiang90/probing v0.0.0-20221125231312-a49e3df8f510 // indirect
	github.com/xlab/treeprint v1.2.0 // indirect
	go.etcd.io/bbolt v1.3.11 // indirect
	go.etcd.io/etcd/client/v2 v2.305.17 // indirect
	go.etcd.io/etcd/pkg/v3 v3.5.17 // indirect
	go.etcd.io/etcd/raft/v3 v3.5.17 // indirect
	go.etcd.io/etcd/server/v3 v3.5.17 // indirect
	go.opencensus.io v0.24.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.56.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.56.0 // indirect
	go.opentelemetry.io/otel v1.31.0 // indirect
	go.opentelemetry.io/otel/metric v1.31.0 // indirect
	go.opentelemetry.io/otel/trace v1.31.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	golang.org/x/crypto v0.31.0 // indirect
	golang.org/x/exp v0.0.0-20241108190413-2d47ceb2692f // indirect
	golang.org/x/mod v0.22.0 // indirect
	golang.org/x/tools v0.27.0 // indirect
	golang.zx2c4.com/wintun v0.0.0-20230126152724-0fa3db229ce2 // indirect
	golang.zx2c4.com/wireguard v0.0.0-20231211153847-12269c276173 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20241223144023-3abc09e42ca8 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20241223144023-3abc09e42ca8 // indirect
	gopkg.in/evanphx/json-patch.v4 v4.12.0 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	k8s.io/cli-runtime v0.32.1 // indirect
	k8s.io/kube-openapi v0.0.0-20241105132330-32ad38e42d3f // indirect
	k8s.io/utils v0.0.0-20241104100929-3ea5e8cea738 // indirect
	kernel.org/pub/linux/libs/security/libcap/psx v1.2.73 // indirect
	rsc.io/qr v0.2.0 // indirect
	sigs.k8s.io/json v0.0.0-20241010143419-9aa6b5e7a4b3 // indirect
	sigs.k8s.io/knftables v0.0.18 // indirect
	sigs.k8s.io/kustomize/api v0.18.0 // indirect
	sigs.k8s.io/kustomize/kyaml v0.18.1 // indirect
	sigs.k8s.io/structured-merge-diff/v4 v4.4.2 // indirect
	tags.cncf.io/container-device-interface v0.8.0 // indirect
	tags.cncf.io/container-device-interface/specs-go v0.8.0 // indirect
)

exclude github.com/containerd/containerd v1.7.0

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C80862C0199
	for <lists+dm-devel@lfdr.de>; Mon, 23 Nov 2020 09:41:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-Yx06nL0vPtaBG0BrgtDSBQ-1; Mon, 23 Nov 2020 03:40:29 -0500
X-MC-Unique: Yx06nL0vPtaBG0BrgtDSBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB32D8030CB;
	Mon, 23 Nov 2020 08:40:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E7E41A4D0;
	Mon, 23 Nov 2020 08:40:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C59254BB7B;
	Mon, 23 Nov 2020 08:40:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKIS7jN012623 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 13:28:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BBFF6101F0D6; Fri, 20 Nov 2020 18:28:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B71CC101F0CA
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 18:28:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27281803DDC
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 18:28:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-225-LsGC9ohBNpKhUmu7wA3dLg-1;
	Fri, 20 Nov 2020 13:28:00 -0500
X-MC-Unique: LsGC9ohBNpKhUmu7wA3dLg-1
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 44F062242B;
	Fri, 20 Nov 2020 18:21:33 +0000 (UTC)
Date: Fri, 20 Nov 2020 12:21:39 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: linux-kernel@vger.kernel.org
Message-ID: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Nov 2020 03:39:39 -0500
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
	linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	usb-storage@lists.one-eyed-alien.net,
	target-devel@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	tipc-discussion@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
	linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
	linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, x86@kernel.org,
	linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
	Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
	netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
	linux-mmc@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	linux-integrity@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [dm-devel] [PATCH 000/141] Fix fall-through warnings for Clang
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

This series aims to fix almost all remaining fall-through warnings in
order to enable -Wimplicit-fallthrough for Clang.

In preparation to enable -Wimplicit-fallthrough for Clang, explicitly
add multiple break/goto/return/fallthrough statements instead of just
letting the code fall through to the next case.

Notice that in order to enable -Wimplicit-fallthrough for Clang, this
change[1] is meant to be reverted at some point. So, this patch helps
to move in that direction.

Something important to mention is that there is currently a discrepancy
between GCC and Clang when dealing with switch fall-through to empty case
statements or to cases that only contain a break/continue/return
statement[2][3][4].

Now that the -Wimplicit-fallthrough option has been globally enabled[5],
any compiler should really warn on missing either a fallthrough annotation
or any of the other case-terminating statements (break/continue/return/
goto) when falling through to the next case statement. Making exceptions
to this introduces variation in case handling which may continue to lead
to bugs, misunderstandings, and a general lack of robustness. The point
of enabling options like -Wimplicit-fallthrough is to prevent human error
and aid developers in spotting bugs before their code is even built/
submitted/committed, therefore eliminating classes of bugs. So, in order
to really accomplish this, we should, and can, move in the direction of
addressing any error-prone scenarios and get rid of the unintentional
fallthrough bug-class in the kernel, entirely, even if there is some minor
redundancy. Better to have explicit case-ending statements than continue to
have exceptions where one must guess as to the right result. The compiler
will eliminate any actual redundancy.

Note that there is already a patch in mainline that addresses almost
40,000 of these issues[6].

I'm happy to carry this whole series in my own tree if people are OK
with it. :)

[1] commit e2079e93f562c ("kbuild: Do not enable -Wimplicit-fallthrough for clang for now")
[2] ClangBuiltLinux#636
[3] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91432
[4] https://godbolt.org/z/xgkvIh
[5] commit a035d552a93b ("Makefile: Globally enable fall-through warning")
[6] commit 4169e889e588 ("include: jhash/signal: Fix fall-through warnings for Clang")

Thanks!

Gustavo A. R. Silva (141):
  afs: Fix fall-through warnings for Clang
  ASoC: codecs: Fix fall-through warnings for Clang
  cifs: Fix fall-through warnings for Clang
  drm/amdgpu: Fix fall-through warnings for Clang
  drm/radeon: Fix fall-through warnings for Clang
  gfs2: Fix fall-through warnings for Clang
  gpio: Fix fall-through warnings for Clang
  IB/hfi1: Fix fall-through warnings for Clang
  igb: Fix fall-through warnings for Clang
  ima: Fix fall-through warnings for Clang
  ipv4: Fix fall-through warnings for Clang
  ixgbe: Fix fall-through warnings for Clang
  media: dvb-frontends: Fix fall-through warnings for Clang
  media: usb: dvb-usb-v2: Fix fall-through warnings for Clang
  netfilter: Fix fall-through warnings for Clang
  nfsd: Fix fall-through warnings for Clang
  nfs: Fix fall-through warnings for Clang
  qed: Fix fall-through warnings for Clang
  qlcnic: Fix fall-through warnings for Clang
  scsi: aic7xxx: Fix fall-through warnings for Clang
  scsi: aic94xx: Fix fall-through warnings for Clang
  scsi: bfa: Fix fall-through warnings for Clang
  staging: rtl8723bs: core: Fix fall-through warnings for Clang
  staging: vt6655: Fix fall-through warnings for Clang
  bnxt_en: Fix fall-through warnings for Clang
  ceph: Fix fall-through warnings for Clang
  drbd: Fix fall-through warnings for Clang
  drm/amd/display: Fix fall-through warnings for Clang
  e1000: Fix fall-through warnings for Clang
  ext2: Fix fall-through warnings for Clang
  ext4: Fix fall-through warnings for Clang
  floppy: Fix fall-through warnings for Clang
  fm10k: Fix fall-through warnings for Clang
  IB/mlx4: Fix fall-through warnings for Clang
  IB/qedr: Fix fall-through warnings for Clang
  ice: Fix fall-through warnings for Clang
  Input: pcspkr - Fix fall-through warnings for Clang
  isofs: Fix fall-through warnings for Clang
  ixgbevf: Fix fall-through warnings for Clang
  kprobes/x86: Fix fall-through warnings for Clang
  mm: Fix fall-through warnings for Clang
  net: 3c509: Fix fall-through warnings for Clang
  net: cassini: Fix fall-through warnings for Clang
  net/mlx4: Fix fall-through warnings for Clang
  net: mscc: ocelot: Fix fall-through warnings for Clang
  netxen_nic: Fix fall-through warnings for Clang
  nfp: Fix fall-through warnings for Clang
  perf/x86: Fix fall-through warnings for Clang
  pinctrl: Fix fall-through warnings for Clang
  RDMA/mlx5: Fix fall-through warnings for Clang
  reiserfs: Fix fall-through warnings for Clang
  security: keys: Fix fall-through warnings for Clang
  selinux: Fix fall-through warnings for Clang
  target: Fix fall-through warnings for Clang
  uprobes/x86: Fix fall-through warnings for Clang
  vxge: Fix fall-through warnings for Clang
  watchdog: Fix fall-through warnings for Clang
  xen-blkfront: Fix fall-through warnings for Clang
  regulator: as3722: Fix fall-through warnings for Clang
  habanalabs: Fix fall-through warnings for Clang
  tee: Fix fall-through warnings for Clang
  HID: usbhid: Fix fall-through warnings for Clang
  HID: input: Fix fall-through warnings for Clang
  ACPI: Fix fall-through warnings for Clang
  airo: Fix fall-through warnings for Clang
  ALSA: hdspm: Fix fall-through warnings for Clang
  ALSA: pcsp: Fix fall-through warnings for Clang
  ALSA: sb: Fix fall-through warnings for Clang
  ath5k: Fix fall-through warnings for Clang
  atm: fore200e: Fix fall-through warnings for Clang
  braille_console: Fix fall-through warnings for Clang
  can: peak_usb: Fix fall-through warnings for Clang
  carl9170: Fix fall-through warnings for Clang
  cfg80211: Fix fall-through warnings for Clang
  crypto: ccree - Fix fall-through warnings for Clang
  decnet: Fix fall-through warnings for Clang
  dm raid: Fix fall-through warnings for Clang
  drm/amd/pm: Fix fall-through warnings for Clang
  drm: Fix fall-through warnings for Clang
  drm/i915/gem: Fix fall-through warnings for Clang
  drm/nouveau/clk: Fix fall-through warnings for Clang
  drm/nouveau: Fix fall-through warnings for Clang
  drm/nouveau/therm: Fix fall-through warnings for Clang
  drm/via: Fix fall-through warnings for Clang
  firewire: core: Fix fall-through warnings for Clang
  hwmon: (corsair-cpro) Fix fall-through warnings for Clang
  hwmon: (max6621) Fix fall-through warnings for Clang
  i3c: master: cdns: Fix fall-through warnings for Clang
  ide: Fix fall-through warnings for Clang
  iio: adc: cpcap: Fix fall-through warnings for Clang
  iwlwifi: iwl-drv: Fix fall-through warnings for Clang
  libata: Fix fall-through warnings for Clang
  mac80211: Fix fall-through warnings for Clang
  media: atomisp: Fix fall-through warnings for Clang
  media: dvb_frontend: Fix fall-through warnings for Clang
  media: rcar_jpu: Fix fall-through warnings for Clang
  media: saa7134: Fix fall-through warnings for Clang
  mmc: sdhci-of-arasan: Fix fall-through warnings for Clang
  mt76: mt7615: Fix fall-through warnings for Clang
  mtd: cfi: Fix fall-through warnings for Clang
  mtd: mtdchar: Fix fall-through warnings for Clang
  mtd: onenand: Fix fall-through warnings for Clang
  mtd: rawnand: fsmc: Fix fall-through warnings for Clang
  mtd: rawnand: stm32_fmc2: Fix fall-through warnings for Clang
  net: ax25: Fix fall-through warnings for Clang
  net: bridge: Fix fall-through warnings for Clang
  net: core: Fix fall-through warnings for Clang
  netfilter: ipt_REJECT: Fix fall-through warnings for Clang
  net: netrom: Fix fall-through warnings for Clang
  net/packet: Fix fall-through warnings for Clang
  net: plip: Fix fall-through warnings for Clang
  net: rose: Fix fall-through warnings for Clang
  nl80211: Fix fall-through warnings for Clang
  phy: qcom-usb-hs: Fix fall-through warnings for Clang
  rds: Fix fall-through warnings for Clang
  rt2x00: Fix fall-through warnings for Clang
  rtl8xxxu: Fix fall-through warnings for Clang
  rtw88: Fix fall-through warnings for Clang
  rxrpc: Fix fall-through warnings for Clang
  scsi: aacraid: Fix fall-through warnings for Clang
  scsi: aha1740: Fix fall-through warnings for Clang
  scsi: csiostor: Fix fall-through warnings for Clang
  scsi: lpfc: Fix fall-through warnings for Clang
  scsi: stex: Fix fall-through warnings for Clang
  sctp: Fix fall-through warnings for Clang
  slimbus: messaging: Fix fall-through warnings for Clang
  staging: qlge: Fix fall-through warnings for Clang
  staging: vt6656: Fix fall-through warnings for Clang
  SUNRPC: Fix fall-through warnings for Clang
  tipc: Fix fall-through warnings for Clang
  tpm: Fix fall-through warnings for Clang
  ubi: Fix fall-through warnings for Clang
  usb: Fix fall-through warnings for Clang
  video: fbdev: lxfb_ops: Fix fall-through warnings for Clang
  video: fbdev: pm2fb: Fix fall-through warnings for Clang
  virtio_net: Fix fall-through warnings for Clang
  wcn36xx: Fix fall-through warnings for Clang
  xen/manage: Fix fall-through warnings for Clang
  xfrm: Fix fall-through warnings for Clang
  zd1201: Fix fall-through warnings for Clang
  Input: libps2 - Fix fall-through warnings for Clang

 arch/x86/events/core.c                                    | 2 +-
 arch/x86/kernel/kprobes/core.c                            | 1 +
 arch/x86/kernel/uprobes.c                                 | 2 ++
 drivers/accessibility/braille/braille_console.c           | 1 +
 drivers/acpi/sbshc.c                                      | 1 +
 drivers/ata/libata-eh.c                                   | 1 +
 drivers/atm/fore200e.c                                    | 1 +
 drivers/block/drbd/drbd_receiver.c                        | 1 +
 drivers/block/drbd/drbd_req.c                             | 1 +
 drivers/block/floppy.c                                    | 1 +
 drivers/block/xen-blkfront.c                              | 1 +
 drivers/char/tpm/eventlog/tpm1.c                          | 1 +
 drivers/crypto/ccree/cc_cipher.c                          | 3 +++
 drivers/firewire/core-topology.c                          | 1 +
 drivers/gpio/gpio-ath79.c                                 | 1 +
 drivers/gpio/gpiolib-acpi.c                               | 1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c                    | 1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c                     | 1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c                     | 1 +
 drivers/gpu/drm/amd/amdgpu/vi.c                           | 1 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c         | 1 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c        | 2 ++
 drivers/gpu/drm/amd/display/dc/core/dc_link.c             | 1 +
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c                 | 2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c    | 1 +
 drivers/gpu/drm/drm_bufs.c                                | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c              | 1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c                      | 1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c               | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c            | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c         | 1 +
 drivers/gpu/drm/radeon/ci_dpm.c                           | 2 +-
 drivers/gpu/drm/radeon/r300.c                             | 1 +
 drivers/gpu/drm/radeon/si_dpm.c                           | 2 +-
 drivers/gpu/drm/via/via_irq.c                             | 1 +
 drivers/hid/hid-input.c                                   | 1 +
 drivers/hid/usbhid/hid-core.c                             | 2 ++
 drivers/hwmon/corsair-cpro.c                              | 1 +
 drivers/hwmon/max6621.c                                   | 2 +-
 drivers/i3c/master/i3c-master-cdns.c                      | 2 ++
 drivers/ide/siimage.c                                     | 1 +
 drivers/iio/adc/cpcap-adc.c                               | 1 +
 drivers/infiniband/hw/hfi1/qp.c                           | 1 +
 drivers/infiniband/hw/hfi1/tid_rdma.c                     | 5 +++++
 drivers/infiniband/hw/mlx4/mad.c                          | 1 +
 drivers/infiniband/hw/mlx5/qp.c                           | 1 +
 drivers/infiniband/hw/qedr/main.c                         | 1 +
 drivers/input/misc/pcspkr.c                               | 1 +
 drivers/input/serio/libps2.c                              | 2 +-
 drivers/md/dm-raid.c                                      | 1 +
 drivers/media/dvb-core/dvb_frontend.c                     | 1 +
 drivers/media/dvb-frontends/cx24120.c                     | 1 +
 drivers/media/dvb-frontends/dib0090.c                     | 2 ++
 drivers/media/dvb-frontends/drxk_hard.c                   | 1 +
 drivers/media/dvb-frontends/m88rs2000.c                   | 1 +
 drivers/media/pci/saa7134/saa7134-tvaudio.c               | 1 +
 drivers/media/platform/rcar_jpu.c                         | 1 +
 drivers/media/usb/dvb-usb-v2/af9015.c                     | 1 +
 drivers/media/usb/dvb-usb-v2/lmedm04.c                    | 1 +
 drivers/misc/habanalabs/gaudi/gaudi.c                     | 1 +
 drivers/mmc/host/sdhci-of-arasan.c                        | 4 ++++
 drivers/mtd/chips/cfi_cmdset_0001.c                       | 1 +
 drivers/mtd/chips/cfi_cmdset_0002.c                       | 2 ++
 drivers/mtd/chips/cfi_cmdset_0020.c                       | 2 ++
 drivers/mtd/mtdchar.c                                     | 1 +
 drivers/mtd/nand/onenand/onenand_samsung.c                | 1 +
 drivers/mtd/nand/raw/fsmc_nand.c                          | 1 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c                    | 2 ++
 drivers/mtd/ubi/build.c                                   | 1 +
 drivers/net/can/usb/peak_usb/pcan_usb_core.c              | 2 ++
 drivers/net/ethernet/3com/3c509.c                         | 1 +
 drivers/net/ethernet/broadcom/bnxt/bnxt.c                 | 1 +
 drivers/net/ethernet/intel/e1000/e1000_hw.c               | 1 +
 drivers/net/ethernet/intel/fm10k/fm10k_mbx.c              | 2 ++
 drivers/net/ethernet/intel/ice/ice_txrx_lib.c             | 1 +
 drivers/net/ethernet/intel/igb/e1000_phy.c                | 1 +
 drivers/net/ethernet/intel/igb/igb_ethtool.c              | 1 +
 drivers/net/ethernet/intel/igb/igb_ptp.c                  | 1 +
 drivers/net/ethernet/intel/ixgbe/ixgbe_82599.c            | 2 ++
 drivers/net/ethernet/intel/ixgbe/ixgbe_common.c           | 1 +
 drivers/net/ethernet/intel/ixgbe/ixgbe_lib.c              | 1 +
 drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c              | 1 +
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c         | 1 +
 drivers/net/ethernet/mellanox/mlx4/resource_tracker.c     | 1 +
 drivers/net/ethernet/mscc/ocelot_vcap.c                   | 1 +
 drivers/net/ethernet/neterion/vxge/vxge-config.c          | 1 +
 drivers/net/ethernet/netronome/nfp/nfp_net_repr.c         | 1 +
 drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c      | 1 +
 drivers/net/ethernet/qlogic/qed/qed_l2.c                  | 1 +
 drivers/net/ethernet/qlogic/qed/qed_sriov.c               | 1 +
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c            | 1 +
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c          | 1 +
 drivers/net/ethernet/sun/cassini.c                        | 1 +
 drivers/net/plip/plip.c                                   | 2 ++
 drivers/net/virtio_net.c                                  | 1 +
 drivers/net/wireless/ath/ath5k/mac80211-ops.c             | 1 +
 drivers/net/wireless/ath/carl9170/tx.c                    | 1 +
 drivers/net/wireless/ath/wcn36xx/smd.c                    | 2 +-
 drivers/net/wireless/cisco/airo.c                         | 1 +
 drivers/net/wireless/intel/iwlwifi/iwl-drv.c              | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c        | 2 +-
 drivers/net/wireless/ralink/rt2x00/rt2x00queue.c          | 1 +
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c     | 8 ++++----
 drivers/net/wireless/realtek/rtw88/fw.c                   | 2 +-
 drivers/net/wireless/zydas/zd1201.c                       | 2 +-
 drivers/phy/qualcomm/phy-qcom-usb-hs.c                    | 1 +
 drivers/pinctrl/renesas/pinctrl-rza1.c                    | 1 +
 drivers/regulator/as3722-regulator.c                      | 3 ++-
 drivers/scsi/aacraid/commsup.c                            | 1 +
 drivers/scsi/aha1740.c                                    | 1 +
 drivers/scsi/aic7xxx/aic79xx_core.c                       | 4 +++-
 drivers/scsi/aic7xxx/aic7xxx_core.c                       | 4 ++--
 drivers/scsi/aic94xx/aic94xx_scb.c                        | 2 ++
 drivers/scsi/aic94xx/aic94xx_task.c                       | 2 ++
 drivers/scsi/bfa/bfa_fcs_lport.c                          | 2 +-
 drivers/scsi/bfa/bfa_ioc.c                                | 6 ++++--
 drivers/scsi/csiostor/csio_wr.c                           | 1 +
 drivers/scsi/lpfc/lpfc_bsg.c                              | 1 +
 drivers/scsi/stex.c                                       | 1 +
 drivers/slimbus/messaging.c                               | 1 +
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c   | 1 +
 drivers/staging/qlge/qlge_main.c                          | 1 +
 drivers/staging/rtl8723bs/core/rtw_cmd.c                  | 1 +
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c             | 1 +
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c            | 1 +
 drivers/staging/vt6655/device_main.c                      | 1 +
 drivers/staging/vt6655/rxtx.c                             | 2 ++
 drivers/staging/vt6656/main_usb.c                         | 1 +
 drivers/target/target_core_iblock.c                       | 1 +
 drivers/target/target_core_pr.c                           | 1 +
 drivers/tee/tee_core.c                                    | 1 +
 drivers/usb/gadget/function/f_fs.c                        | 2 ++
 drivers/usb/gadget/function/f_loopback.c                  | 2 +-
 drivers/usb/gadget/function/f_sourcesink.c                | 1 +
 drivers/usb/gadget/udc/dummy_hcd.c                        | 2 ++
 drivers/usb/host/fotg210-hcd.c                            | 2 +-
 drivers/usb/host/isp116x-hcd.c                            | 1 +
 drivers/usb/host/max3421-hcd.c                            | 1 +
 drivers/usb/host/oxu210hp-hcd.c                           | 1 +
 drivers/usb/misc/yurex.c                                  | 1 +
 drivers/usb/musb/tusb6010.c                               | 1 +
 drivers/usb/storage/ene_ub6250.c                          | 1 +
 drivers/usb/storage/uas.c                                 | 1 +
 drivers/video/fbdev/geode/lxfb_ops.c                      | 1 +
 drivers/video/fbdev/pm2fb.c                               | 1 +
 drivers/watchdog/machzwd.c                                | 1 +
 drivers/xen/manage.c                                      | 1 +
 fs/afs/cmservice.c                                        | 5 +++++
 fs/afs/fsclient.c                                         | 4 ++++
 fs/afs/vlclient.c                                         | 1 +
 fs/ceph/dir.c                                             | 2 ++
 fs/cifs/inode.c                                           | 1 +
 fs/cifs/sess.c                                            | 1 +
 fs/cifs/smbdirect.c                                       | 1 +
 fs/ext2/inode.c                                           | 1 +
 fs/ext4/super.c                                           | 1 +
 fs/gfs2/inode.c                                           | 2 ++
 fs/gfs2/recovery.c                                        | 1 +
 fs/isofs/rock.c                                           | 1 +
 fs/nfs/nfs3acl.c                                          | 1 +
 fs/nfs/nfs4client.c                                       | 1 +
 fs/nfs/nfs4proc.c                                         | 2 ++
 fs/nfs/nfs4state.c                                        | 1 +
 fs/nfs/pnfs.c                                             | 2 ++
 fs/nfsd/nfs4state.c                                       | 1 +
 fs/nfsd/nfsctl.c                                          | 1 +
 fs/reiserfs/namei.c                                       | 1 +
 mm/mm_init.c                                              | 1 +
 mm/vmscan.c                                               | 1 +
 net/ax25/af_ax25.c                                        | 1 +
 net/bridge/br_input.c                                     | 1 +
 net/core/dev.c                                            | 1 +
 net/decnet/dn_route.c                                     | 2 +-
 net/ipv4/ah4.c                                            | 1 +
 net/ipv4/esp4.c                                           | 1 +
 net/ipv4/fib_semantics.c                                  | 1 +
 net/ipv4/ip_vti.c                                         | 1 +
 net/ipv4/ipcomp.c                                         | 1 +
 net/ipv4/netfilter/ipt_REJECT.c                           | 1 +
 net/mac80211/cfg.c                                        | 2 ++
 net/netfilter/nf_conntrack_proto_dccp.c                   | 1 +
 net/netfilter/nf_tables_api.c                             | 1 +
 net/netfilter/nft_ct.c                                    | 1 +
 net/netrom/nr_route.c                                     | 4 ++++
 net/packet/af_packet.c                                    | 1 +
 net/rds/tcp_connect.c                                     | 1 +
 net/rds/threads.c                                         | 2 ++
 net/rose/rose_route.c                                     | 2 ++
 net/rxrpc/af_rxrpc.c                                      | 1 +
 net/sctp/input.c                                          | 3 ++-
 net/sunrpc/rpc_pipe.c                                     | 1 +
 net/sunrpc/xprtsock.c                                     | 1 +
 net/tipc/link.c                                           | 1 +
 net/wireless/nl80211.c                                    | 1 +
 net/wireless/util.c                                       | 1 +
 net/xfrm/xfrm_interface.c                                 | 1 +
 security/integrity/ima/ima_main.c                         | 1 +
 security/integrity/ima/ima_policy.c                       | 2 ++
 security/keys/process_keys.c                              | 1 +
 security/selinux/hooks.c                                  | 1 +
 sound/drivers/pcsp/pcsp_input.c                           | 1 +
 sound/isa/sb/sb8_main.c                                   | 1 +
 sound/pci/rme9652/hdspm.c                                 | 1 +
 sound/soc/codecs/adav80x.c                                | 1 +
 sound/soc/codecs/arizona.c                                | 1 +
 sound/soc/codecs/cs42l52.c                                | 1 +
 sound/soc/codecs/cs42l56.c                                | 1 +
 sound/soc/codecs/cs47l92.c                                | 1 +
 sound/soc/codecs/wm8962.c                                 | 1 +
 209 files changed, 264 insertions(+), 26 deletions(-)

-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


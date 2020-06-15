Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0C01F8EE9
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jun 2020 08:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592204342;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6mspnL3sJx8Zh+JXrQbsnL7P/tG4YKmZZ31S3utLg3g=;
	b=W7ckQ+L9kMXYUQ4qI2G0qqjxDMjEks8TA7bBoyaB4cSdJcuRoQ4mcm+PuMkYW/hyoV/haw
	hxMa/mNq9WKxETqlKnNcdtKje7Zxrli2LaToDqoGDlsvdencPC4Ml5qEzbK0/17G+v7vV+
	8MgYNs1u/DigsgRvhZZU74PY4DkrnWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-UY5za3kuNluNqiUvPjUpew-1; Mon, 15 Jun 2020 02:58:02 -0400
X-MC-Unique: UY5za3kuNluNqiUvPjUpew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B3F5846349;
	Mon, 15 Jun 2020 06:57:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AC129033D;
	Mon, 15 Jun 2020 06:57:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDFC81809554;
	Mon, 15 Jun 2020 06:57:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05F6teLu029900 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Jun 2020 02:55:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 258362029F61; Mon, 15 Jun 2020 06:55:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2119B2029F62
	for <dm-devel@redhat.com>; Mon, 15 Jun 2020 06:55:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20EF6804026
	for <dm-devel@redhat.com>; Mon, 15 Jun 2020 06:55:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-476-yyDZZ8ZsOqSmPXBRcdmg6Q-1;
	Mon, 15 Jun 2020 02:55:15 -0400
X-MC-Unique: yyDZZ8ZsOqSmPXBRcdmg6Q-1
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
	[95.90.213.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 75D7A2074D;
	Mon, 15 Jun 2020 06:47:15 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
	(envelope-from <mchehab@kernel.org>)
	id 1jkith-009nlx-C3; Mon, 15 Jun 2020 08:47:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Mon, 15 Jun 2020 08:46:39 +0200
Message-Id: <cover.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05F6teLu029900
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 15 Jun 2020 02:57:28 -0400
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
	Paul Mackerras <paulus@samba.org>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arch@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
	Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
	David Airlie <airlied@linux.ie>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Eric Dumazet <edumazet@google.com>, keyrings@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Alasdair Kergon <agk@redhat.com>,
	Daniel Kiss <daniel.kiss@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>, linux-arm-msm@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>,
	Tony Luck <tony.luck@intel.com>, dm-devel@redhat.com,
	Alexey Gladkov <gladkov.alexey@gmail.com>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	Sandy Huang <hjc@rock-chips.com>, linux-f2fs-devel@lists.sourceforge.net,
	linux-renesas-soc@vger.kernel.org,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	linux-pci@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>, linux-kselftest@vger.kernel.org,
	Joel Fernandes <joel@joelfernandes.org>,
	Sukadev Bhattiprolu <sukadev@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Haren Myneni <haren@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Jade Alglave <j.alglave@ucl.ac.uk>, Alexey Dobriyan <adobriyan@gmail.com>,
	Fenghua Yu <fenghua.yu@intel.com>, Marco Elver <elver@google.com>,
	Kees Cook <keescook@chromium.org>, Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Luc Maranget <luc.maranget@inria.fr>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Thiago Jung Bauermann <bauerman@linux.ibm.com>, Jan Kara <jack@suse.cz>,
	"Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
	Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	x86@kernel.org, Russell King <linux@armlinux.org.uk>,
	Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>, Chao Yu <chao@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, Robin Murphy <robin.murphy@arm.com>,
	Akira Shimahara <akira215corp@gmail.com>,
	linux-mips@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, Borislav Petkov <bp@alien8.de>,
	linuxppc-dev@lists.ozlabs.org
Subject: [dm-devel] [PATCH 00/29] Documentation fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jon,

That's a bunch of files I have to be applied on the top of v5.8-rc1 fixing
documentation warnings. I already removed some duplicated stuff.

Regards,
Mauro

Mauro Carvalho Chehab (29):
  mm: vmalloc.c: remove a kernel-doc annotation from a removed parameter
  net: dev: add a missing kernel-doc annotation
  net: netdevice.h: add a description for napi_defer_hard_irqs
  scripts/kernel-doc: parse __ETHTOOL_DECLARE_LINK_MODE_MASK
  net: pylink.h: add kernel-doc descriptions for new fields at
    phylink_config
  scripts/kernel-doc: handle function pointer prototypes
  fs: fs.h: fix a kernel-doc parameter description
  gpio: driver.h: fix kernel-doc markup
  kcsan: fix a kernel-doc warning
  rcu: fix some kernel-doc warnings
  fs: docs: f2fs.rst: fix a broken table
  dt: update a reference for reneases pcar file renamed to yaml
  dt: fix broken links due to txt->yaml renames
  dt: Fix broken references to renamed docs
  dt: fix reference to olpc,xo1.75-ec.txt
  selftests/vm/keys: fix a broken reference at protection_keys.c
  docs: hugetlbpage.rst: fix some warnings
  docs: powerpc: fix some issues at vas-api.rst
  docs: driver-model: remove a duplicated markup at driver.rst
  docs: watch_queue.rst: supress some Sphinx warnings and move to
    core-api
  docs: device-mapper: add dm-ebs.rst to an index file
  docs: it_IT: add two missing references
  docs: ABI: fix a typo when pointing to w1-generic.rst
  docs: fs: locking.rst: fix a broken table
  docs: add bus-virt-phys-mapping.txt to core-api
  docs: fix references for DMA*.txt files
  docs: dt: minor adjustments at writing-schema.rst
  docs: fs: proc.rst: fix a warning due to a merge conflict
  docs: fs: proc.rst: convert a new chapter to ReST

 .../ABI/testing/sysfs-driver-w1_therm         |   2 +-
 Documentation/PCI/pci.rst                     |   6 +-
 .../admin-guide/device-mapper/index.rst       |   1 +
 Documentation/admin-guide/mm/hugetlbpage.rst  |  25 ++-
 Documentation/block/biodoc.rst                |   2 +-
 .../bus-virt-phys-mapping.rst}                |   2 +-
 Documentation/core-api/dma-api.rst            |   6 +-
 Documentation/core-api/dma-isa-lpc.rst        |   2 +-
 Documentation/core-api/index.rst              |   2 +
 Documentation/{ => core-api}/watch_queue.rst  |  34 ++--
 .../bindings/arm/freescale/fsl,scu.txt        |   2 +-
 .../bindings/display/bridge/sii902x.txt       |   2 +-
 .../bindings/display/imx/fsl-imx-drm.txt      |   4 +-
 .../devicetree/bindings/display/imx/ldb.txt   |   4 +-
 .../display/rockchip/rockchip-drm.yaml        |   2 +-
 .../bindings/misc/olpc,xo1.75-ec.txt          |   2 +-
 .../bindings/net/mediatek-bluetooth.txt       |   2 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt  |   2 +-
 .../bindings/sound/audio-graph-card.txt       |   2 +-
 .../bindings/sound/st,sti-asoc-card.txt       |   2 +-
 .../bindings/spi/qcom,spi-geni-qcom.txt       |   2 +-
 Documentation/devicetree/writing-schema.rst   |   9 +-
 .../driver-api/driver-model/driver.rst        |   2 -
 Documentation/driver-api/usb/dma.rst          |   6 +-
 Documentation/filesystems/f2fs.rst            | 150 ++++++++++++------
 Documentation/filesystems/locking.rst         |   6 +-
 Documentation/filesystems/proc.rst            |  46 +++---
 Documentation/memory-barriers.txt             |   6 +-
 Documentation/mips/ingenic-tcu.rst            |   2 +-
 Documentation/powerpc/vas-api.rst             |  23 ++-
 Documentation/security/keys/core.rst          |   2 +-
 .../it_IT/process/management-style.rst        |   2 +
 .../it_IT/process/submitting-patches.rst      |   2 +
 .../translations/ko_KR/memory-barriers.txt    |   6 +-
 MAINTAINERS                                   |   8 +-
 arch/ia64/hp/common/sba_iommu.c               |  12 +-
 arch/parisc/kernel/pci-dma.c                  |   2 +-
 arch/x86/include/asm/dma-mapping.h            |   4 +-
 arch/x86/kernel/amd_gart_64.c                 |   2 +-
 drivers/parisc/sba_iommu.c                    |  14 +-
 include/linux/dma-mapping.h                   |   2 +-
 include/linux/fs.h                            |   2 +-
 include/linux/gpio/driver.h                   |   2 +-
 include/linux/kcsan-checks.h                  |  10 +-
 include/linux/netdevice.h                     |   2 +
 include/linux/phylink.h                       |   4 +
 include/linux/rculist.h                       |   2 +-
 include/linux/watch_queue.h                   |   2 +-
 include/media/videobuf-dma-sg.h               |   2 +-
 init/Kconfig                                  |   2 +-
 kernel/dma/debug.c                            |   2 +-
 kernel/watch_queue.c                          |   2 +-
 mm/vmalloc.c                                  |   1 -
 net/core/dev.c                                |   1 +
 scripts/kernel-doc                            |   7 +
 tools/testing/selftests/vm/protection_keys.c  |   2 +-
 56 files changed, 282 insertions(+), 175 deletions(-)
 rename Documentation/{bus-virt-phys-mapping.txt => core-api/bus-virt-phys-mapping.rst} (99%)
 rename Documentation/{ => core-api}/watch_queue.rst (94%)

-- 
2.26.2



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


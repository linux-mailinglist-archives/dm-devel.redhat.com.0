Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD0051D2EA
	for <lists+dm-devel@lfdr.de>; Fri,  6 May 2022 10:12:05 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-j4-0KvcfNjOojM9uoobbEg-1; Fri, 06 May 2022 04:11:39 -0400
X-MC-Unique: j4-0KvcfNjOojM9uoobbEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27F7586B8AB;
	Fri,  6 May 2022 08:11:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD111415112;
	Fri,  6 May 2022 08:11:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B1C871947057;
	Fri,  6 May 2022 08:11:36 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 843991947058
 for <dm-devel@listman.corp.redhat.com>; Fri,  6 May 2022 08:11:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D6BE9E95; Fri,  6 May 2022 08:11:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 589F79E93
 for <dm-devel@redhat.com>; Fri,  6 May 2022 08:11:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F09A866DFA
 for <dm-devel@redhat.com>; Fri,  6 May 2022 08:11:12 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-jrcL25xBOnSaB2ytmuXZcg-1; Fri, 06 May 2022 04:11:09 -0400
X-MC-Unique: jrcL25xBOnSaB2ytmuXZcg-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220506081108euoutp0125fd10a733a6df2ba9fe6e4a40b958bd~sdcjJ6DaC2306323063euoutp01A
 for <dm-devel@redhat.com>; Fri,  6 May 2022 08:11:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220506081108euoutp0125fd10a733a6df2ba9fe6e4a40b958bd~sdcjJ6DaC2306323063euoutp01A
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220506081106eucas1p207e8015092f0e2deadd151705729da43~sdchgzEs-0616806168eucas1p2e;
 Fri,  6 May 2022 08:11:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 70.05.09887.A18D4726; Fri,  6
 May 2022 09:11:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220506081106eucas1p181e83ef352eb8bfb1752bee0cf84020f~sdcg5V4RU1756417564eucas1p1w;
 Fri,  6 May 2022 08:11:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220506081106eusmtrp1ffe7e1fcd389b80a44485d3379169b1f~sdcg3wtYO3089330893eusmtrp1K;
 Fri,  6 May 2022 08:11:06 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-23-6274d81aaf58
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A7.E9.09404.918D4726; Fri,  6
 May 2022 09:11:06 +0100 (BST)
Received: from localhost (unknown [106.210.248.174]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220506081105eusmtip2b916ca212802379169a16b9e436b7f61~sdcghBJ0K2136621366eusmtip2T;
 Fri,  6 May 2022 08:11:05 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, hare@suse.de, dsterba@suse.com, axboe@kernel.dk,
 hch@lst.de, damien.lemoal@opensource.wdc.com, snitzer@kernel.org
Date: Fri,  6 May 2022 10:10:54 +0200
Message-Id: <20220506081105.29134-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxjd23t7e20AL6XRd2DC0sUpOkBwS965RSTbzN32Y2qWGJYtWvCu
 kJUqbRFUMvkan8UCYyCVqVM3sKJY2hHBttMqBUeVjwoCThpCAWWswEq3MSuscOvmv3POe87z
 nCd5SUzQSISSKTIlI5eJpSKCj7dYF+5Fhg4qE7fYTK+jpl+sGFoyWgl06ZGaQNWzCxiqVJ/k
 oad3uzFkcp3iop6/czho6EYrBxnPVXLQxUvtHORs0mBIdWMWRxfzRzHkHY1Bo/PDOKq0DAA0
 3q/hINPwZtQ31sBDRtMdHNnb6gh05sdxHiov8GCookPPRe4f8nnoym8zOOocDtuxjrbf/4he
 7Gwk6Io8F4/uHtHhtP1uOt2sLSbo77O/xWj9heP09aFsgi7LcxF069cOLj1j7ifoEwYtoJsM
 /Tit7zpGl+t13F2CT/nvHGCkKYcZefT2/fzk6iUP51Dpzky11cvLBgWoBKwiIfUGfOJsIkoA
 nxRQDQA+9EwAlswDaCnJ5bLEDWDNdA3vv4hrye+qB3D09vP8EwCLfs31uUiSoDbBnGLesi6k
 SgFUOwpXCEaVceFQ5z18eVQItR2WaAtXxuLUenj5n5srOJB6CzrqVIBdFw5r+/7y68HwTq1z
 JYv59LyfTmHLQyFVy4cGh4rLBt6DtwumMRaHwKkOg7/3Otj1jQpn8TE4PvjUH8731WtdvoH0
 kbfhCZt0GWJUBGxqi2bt8XCkzcNlHUFw8PdgtkIQrGypwVg5EBYVCFi3CLYuOP1LIbTn1vmX
 0tCgrl3BAupzOHfVRZSDVzQvHKZ54TDN/x3OAkwL1jLpilQJo4iVMRlRCnGqIl0miUo6mNoM
 fB+6a7Fj/hqon5qLsgAOCSwAkphIGBiiUSYKAg+Ijxxl5Af3ydOljMICwkhctDYwKeWqWEBJ
 xErmS4Y5xMifv3LIVaHZnCNDFTFZ7tUji2PC2SRZQNrjWFVkQoPxinu/8Nx5z2tj0Ub9J9T9
 ycLT5rAEXeGWl43XQ8PcnyUOLLzbWJ9xBssG5iDUszgRfta98dZu91zkw2vNWkUZvutRYmal
 OuNx7J6qtsui8JO8rQGTtmf2vnjqdMai6GZycUSZ7YG0qDOiu5d44GmYzS36WMnfYL21dxsz
 sHci7v328/vWmG2Zk6+ur0BOzZ8vZUxlVW1L2OHV90jKSnO68o7/8V3/F2uewclqHaxR2SVS
 q+5o8M9xzrjV9YeVOzXemSw6vkW7NcA46A01bzbZBNPCPb0dF6Lj0trTJroTPiA2Kr76sNfx
 ZpUIVySLYzZhcoX4X4Nv+Y8/BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsVy+t/xe7pSN0qSDH58ZLJYf+oYs8X/PcfY
 LFbf7WezmPbhJ7PFpP4Z7Ba/z55nttj7bjarxYUfjUwWNw/sZLLYs2gSk8XK1UeZLJ6sn8Vs
 0XPgA4vFypaHzBZ/HhpaPPxyi8Vi0qFrjBZPr85isth7S9vi0uMV7BZ79p5ksbi8aw6bxfxl
 T9ktJrR9ZbaYeHwzq8XnpS3sFutev2exOHFL2kHG4/IVb49/J9aweUxsfsfucf7eRhaPy2dL
 PTat6mTzWNgwldlj85J6j903G9g8epvfsXnsbL3P6vF+31U2j74tqxg91m+5yuKx+XS1x4TN
 G1kDhKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0
 Mqb9/8pU0O1W0X/sD3sDY5tFFyMnh4SAicTLd/8Zuxi5OIQEljJKbF/6hgUiISFxe2ETI4Qt
 LPHnWhcbRNFzRonFrT+AHA4ONgEticZOdpC4iMBURolL606ygDjMAotZJdpu7GUF6RYWsJPo
 WtXODmKzCKhKrP11EMzmFbCUuD+nB2qDvMTMS9/ZQYYyC2hKrN+lD1EiKHFy5hOwg5iBSpq3
 zmaewMg/C6FqFpKqWUiqFjAyr2IUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAhMI9uO/dyyg3Hl
 q496hxiZOBgPMUpwMCuJ8ArPKkkS4k1JrKxKLcqPLyrNSS0+xGgKdPVEZinR5HxgIssriTc0
 MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamCySLT0vOersc7+7AbG2Zte
 lC4SvLbaeveFaIlSE/GdLNqCk6acOd7rdLK3/ETQl8lmfIrfNtzSzI3m28Z5y0O+ptKYK0gx
 4qhC4IfJBb3fkytX2efGvyg+LyVedG2n423VkPm3fs5clbmF57v5TZbrDyXX+L2ZtMOHhTv8
 b4vNAbtDtcUX3lcoVZ66EX0xqalo46aY7PrjdU8Dw/edztbZ5nD+/+yQLxFTdmY6bso+GDxN
 2jbt/Ocuy+u5T1K/SxjyzeMUY6l7vPf/vgU5Ogov3jcWHFI9YvCD+bpDjsbJNY9jAt/Wfda+
 6LK2JfWGZUoICwfnY9ej+7/MtFu/tXv38s0T9szL8XxfXFK0mztNiaU4I9FQi7moOBEALbx7
 YawDAAA=
X-CMS-MailID: 20220506081106eucas1p181e83ef352eb8bfb1752bee0cf84020f
X-Msg-Generator: CA
X-RootMTR: 20220506081106eucas1p181e83ef352eb8bfb1752bee0cf84020f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220506081106eucas1p181e83ef352eb8bfb1752bee0cf84020f
References: <CGME20220506081106eucas1p181e83ef352eb8bfb1752bee0cf84020f@eucas1p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [dm-devel] [PATCH v3 00/11] support non power of 2 zoned devices
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, bvanassche@acm.org, gost.dev@samsung.com,
 Pankaj Raghav <p.raghav@samsung.com>, Josef Bacik <josef@toxicpanda.com>,
 linux-nvme@lists.infradead.org, jiangbo.365@bytedance.com,
 Jens Axboe <axboe@fb.com>, Chris Mason <clm@fb.com>, dm-devel@redhat.com,
 linux-btrfs@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 jonathan.derrick@linux.dev, linux-fsdevel@vger.kernel.org,
 Chaitanya Kulkarni <kch@nvidia.com>, Johannes Thumshirn <jth@kernel.org>,
 Keith Busch <kbusch@kernel.org>, matias.bjorling@wdc.com,
 Sagi Grimberg <sagi@grimberg.me>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Background and Motivation:

The zone storage implementation in Linux, introduced since v4.10, first
targetted SMR drives which have a power of 2 (po2) zone size alignment
requirement. The po2 zone size was further imposed implicitly by the
block layer's blk_queue_chunk_sectors(), used to prevent IO merging
across chunks beyond the specified size, since v3.16 through commit
762380ad9322 ("block: add notion of a chunk size for request merging").
But this same general block layer po2 requirement for blk_queue_chunk_sectors()
was removed on v5.10 through commit 07d098e6bbad ("block: allow 'chunk_sectors'
to be non-power-of-2").

NAND, which is the media used in newer zoned storage devices, does not
naturally align to po2. In these devices, zone cap is not the same as the
po2 zone size. When the zone cap != zone size, then unmapped LBAs are
introduced to cover the space between the zone cap and zone size. po2
requirement does not make sense for these type of zone storage devices.
This patch series aims to remove these unmapped LBAs for zoned devices when
zone cap is npo2. This is done by relaxing the po2 zone size constraint
in the kernel and allowing zoned device with npo2 zone sizes if zone cap
== zone size.

Removing the po2 requirement from zone storage should be possible
now provided that no userspace regression and no performance regressions are
introduced. Stop-gap patches have been already merged into f2fs-tools to
proactively not allow npo2 zone sizes until proper support is added [0].
Additional kernel stop-gap patches are provided in this series for dm-zoned.
Support for npo2 zonefs and btrfs support is addressed in this series.

There was an effort previously [1] to add support to non po2 devices via
device level emulation but that was rejected with a final conclusion
to add support for non po2 zoned device in the complete stack[2].

- Patchset description:
This patchset aims at adding support to non power of 2 zoned devices in
the block layer, nvme layer, null blk and adds support to btrfs and
zonefs.

This round of patches **will not** support DM layer for non
power of 2 zoned devices. More about this in the future work section.

Patches 1-2 deals with removing the po2 constraint from the
block layer.

Patches 3-4 deals with removing the constraint from nvme zns.

Patches 5-8 adds support to btrfs for non po2 zoned devices.

Patch 9 removes the po2 constraint in ZoneFS

Patch 10 removes the po2 contraint in null blk

Patches 11 adds conditions to not allow non power of 2 devices in
DM.

The patch series is based on linux-next tag: next-20220502

- Performance:
PO2 zone sizes utilizes log and shifts instead of division when
determing alignment, zone number, etc. The same math cannot be used when
using a zoned device with non po2 zone size. Hence, to avoid any performance
regression on zoned devices with po2 zone sizes, the optimized math in the
hot paths has been retained with branching.

The performance was measured using null blk for regression
and the results have been posted in the appropriate commit log. No
performance regression was noticed.

- Testing
With respect to testing we need to tackle two things: one for regression
on po2 zoned device and progression on non po2 zoned devices.

kdevops (https://github.com/mcgrof/kdevops) was extensively used to
automate the testing for blktests and (x)fstests for btrfs changes. The
known failures were excluded during the test based on the baseline
v5.17.0-rc7

-- regression
Emulated zoned device with zone size =128M , nr_zones = 10000

Block and nvme zns:
blktests were run with no new failures

Btrfs:
Changes were tested with the following profile in QEMU:
[btrfs_simple_zns]
TEST_DIR=<dir>
SCRATCH_MNT=<mnt>
FSTYP=btrfs
MKFS_OPTIONS="-f -d single -m single"
TEST_DEV=<dev>
SCRATCH_DEV_POOL=<dev-pool>

No new failures were observed in btrfs, generic and shared test suite

ZoneFS:
zonefs-tests-nullblk.sh and zonefs-tests.sh from zonefs-tools were run
with no failures.

nullblk:
t/zbd/run-tests-against-nullb from fio was run with no failures.

DM:
It was verified if dm-zoned successfully mounts without any
error.

-- progression
Emulated zoned device with zone size = 96M , nr_zones = 10000

Block and nvme zns:
blktests were run with no new failures

Btrfs:
Same profile as po2 zone size was used.

Many tests in xfstests for btrfs included dm-flakey and some tests
required dm-linear. As they are not supported at the moment for non
po2 devices, those **tests were excluded for non po2 devices**.

No new failures were observed in btrfs, generic and shared test suite

ZoneFS:
zonefs-tests.sh from zonefs-tools were run with no failures.

nullblk:
A new section was added to cover non po2 devices:

section14()
{
       conv_pcnt=10
       zone_size=3
       zone_capacity=3
       max_open=${set_max_open}
       zbd_test_opts+=("-o ${max_open}")
}
t/zbd/run-tests-against-nullb from fio was run with no failures.

DM:
It was verified that dm-zoned does not mount.

- Open issue:
* btrfs superblock location for zoned devices is expected to be in 0,
  512GB(mirror) and 4TB(mirror) in the device. Zoned devices with po2
  zone size will naturally align with these superblock location but non
  po2 devices will not align with 512GB and 4TB offset.

  The current approach for npo2 devices is to place the superblock mirror
  zones near   512GB and 4TB that is **aligned to the zone size**. This
  is of no issue for normal operation as we keep track where the superblock
  mirror are placed but this can cause an issue with recovery tools for
  zoned devices as they expect mirror superblock to be in 512GB and 4TB.

  Note that ATM, recovery tools such as `btrfs check` does not work for
  image dumps for zoned devices even for po2 zone sizes.

- Tools:
Some tools had to be updated to support non po2 devices. Once these
patches are accepted in the kernel, these tool updates will also be
upstreamed.
* btrfs-prog: https://github.com/Panky-codes/btrfs-progs/tree/remove-po2-btrfs
* blkzone: https://github.com/Panky-codes/util-linux/tree/remove-po2
* zonefs-tools: https://github.com/Panky-codes/zonefs-tools/tree/remove-po2

- Future work
To reduce the amount of changes and testing, support for DM was
excluded in this round of patches. The plan is to add support to F2FS
and DM in the forthcoming future.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=6afcf6493578e77528abe65ab8b12f3e1c16749f
[1] https://lore.kernel.org/all/20220310094725.GA28499@lst.de/T/
[2] https://lore.kernel.org/all/20220315135245.eqf4tqngxxb7ymqa@unifi/

Changes since v1:
- Put the function declaration and its usage in the same commit (Bart)
- Remove bdev_zone_aligned function (Bart)
- Change the name from blk_queue_zone_aligned to blk_queue_is_zone_start
  (Damien)
- q is never null in from bdev_get_queue (Damien)
- Add condition during bringup and check for zsze == zcap for npo2
  drives (Damien)
- Rounddown operation should be made generic to work in 32 bits arch
  (bart)
- Add comments where generic calculation is directly used instead having
  special handling for po2 zone sizes (Hannes)
- Make the minimum zone size alignment requirement for btrfs to be 1M
  instead of BTRFS_STRIPE_LEN(David)

Changes since v2:
- Minor formatting changes

Luis Chamberlain (1):
  dm-zoned: ensure only power of 2 zone sizes are allowed

Pankaj Raghav (10):
  block: make blkdev_nr_zones and blk_queue_zone_no generic for npo2
    zsze
  block: allow blk-zoned devices to have non-power-of-2 zone size
  nvme: zns: Allow ZNS drives that have non-power_of_2 zone size
  nvmet: Allow ZNS target to support non-power_of_2 zone sizes
  btrfs: zoned: Cache superblock location in btrfs_zoned_device_info
  btrfs: zoned: Make sb_zone_number function non power of 2 compatible
  btrfs: zoned: use generic btrfs zone helpers to support npo2 zoned
    devices
  btrfs: zoned: relax the alignment constraint for zoned devices
  zonefs: allow non power of 2 zoned devices
  null_blk: allow non power of 2 zoned devices

 block/blk-core.c               |   3 +-
 block/blk-zoned.c              |  40 ++++++++---
 drivers/block/null_blk/main.c  |   5 +-
 drivers/block/null_blk/zoned.c |  14 ++--
 drivers/md/dm-zone.c           |  12 ++++
 drivers/nvme/host/zns.c        |  24 ++++---
 drivers/nvme/target/zns.c      |   2 +-
 fs/btrfs/volumes.c             |  24 ++++---
 fs/btrfs/zoned.c               | 123 ++++++++++++++++++---------------
 fs/btrfs/zoned.h               |  44 ++++++++++--
 fs/zonefs/super.c              |   6 +-
 fs/zonefs/zonefs.h             |   1 -
 include/linux/blkdev.h         |  37 +++++++++-
 13 files changed, 228 insertions(+), 107 deletions(-)

-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


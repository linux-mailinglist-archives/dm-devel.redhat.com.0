Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A45311D4
	for <lists+dm-devel@lfdr.de>; Mon, 23 May 2022 18:16:27 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-qpK6iqgdO_yvyQ5LjhpnQg-1; Mon, 23 May 2022 12:16:22 -0400
X-MC-Unique: qpK6iqgdO_yvyQ5LjhpnQg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF335185A79C;
	Mon, 23 May 2022 16:16:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD90B492CA3;
	Mon, 23 May 2022 16:16:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4245E194706D;
	Mon, 23 May 2022 16:16:11 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 803E71947059
 for <dm-devel@listman.corp.redhat.com>; Mon, 23 May 2022 16:16:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3876140314F; Mon, 23 May 2022 16:16:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 348D6492C14
 for <dm-devel@redhat.com>; Mon, 23 May 2022 16:16:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1878585A5B5
 for <dm-devel@redhat.com>; Mon, 23 May 2022 16:16:10 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-Y9Uf2IMZOh6kemaLystL3Q-1; Mon, 23 May 2022 12:16:08 -0400
X-MC-Unique: Y9Uf2IMZOh6kemaLystL3Q-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220523161605euoutp01372c1a11e9aeaf0d984a5c4b0a3994b1~xyB0gdllt1771117711euoutp01H
 for <dm-devel@redhat.com>; Mon, 23 May 2022 16:16:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220523161605euoutp01372c1a11e9aeaf0d984a5c4b0a3994b1~xyB0gdllt1771117711euoutp01H
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220523161604eucas1p18e1599366870ced2caaea6e714e3fdab~xyBzELZfI1866318663eucas1p10;
 Mon, 23 May 2022 16:16:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 64.7E.09887.343BB826; Mon, 23
 May 2022 17:16:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220523161603eucas1p1719a165f769b5ad69717ad9b5f4decc3~xyByloXg21867818678eucas1p15;
 Mon, 23 May 2022 16:16:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220523161603eusmtrp26c910ee4d3c1c2403b8ff21385aedc84~xyBykw9vH0219002190eusmtrp2D;
 Mon, 23 May 2022 16:16:03 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-0a-628bb3433873
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 36.92.09522.343BB826; Mon, 23
 May 2022 17:16:03 +0100 (BST)
Received: from localhost (unknown [106.210.248.20]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220523161603eusmtip17e3440713797cf86bc0c026d7bcd57c4~xyByMjd5u2231022310eusmtip1T;
 Mon, 23 May 2022 16:16:03 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: axboe@kernel.dk, hch@lst.de, snitzer@redhat.com,
 damien.lemoal@opensource.wdc.com, hare@suse.de, Johannes.Thumshirn@wdc.com
Date: Mon, 23 May 2022 18:15:54 +0200
Message-Id: <20220523161601.58078-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBKsWRmVeSWpSXmKPExsWy7djP87rOm7uTDPYfsbFYfbefzeL32fPM
 FnvfzWa1uPCjkcni5oGdTBZ7Fk1isli5+iiTxZP1s5gteg58YLH423WPyWLvLW2Ly7vmsFnM
 X/aU3eLz0hZ2i7aNXxkd+D3+nVjD5nH5bKnHplWdbB6bl9R77L7ZwOaxs/U+q8f7fVfZPPq2
 rGL0WL/lKovH5tPVHp83yXm0H+hmCuCJ4rJJSc3JLEst0rdL4MpouNXKUnBQu6J351u2BsZ+
 5S5GTg4JAROJc+uuMncxcnEICaxglJjzaRkLhPOFUeLXpgYWkCohgc+MEldeyMN0/D80kw2i
 aDmjRNfc3awQzgtGidt9E5m6GDk42AS0JBo72UHiIgKNjBLvj84DK2IW+Moo0f5wPhvIKGEB
 G4l1WxeCrWARUJW4tOQ9I4jNK2ApcWTKD1aIdfISMy99Z4eIC0qcnPkErJ4ZKN68dTbY4RIC
 szkl3p09zALR4CIxZ8ZXJghbWOLV8S3sELaMxP+d86Hi1RJPb/yGam5hlOjfuZ4N5GwJAWuJ
 vjM5ICazgKbE+l36EOWOEtvWz2WCqOCTuPFWEOIEPolJ26YzQ4R5JTrahCCqlSR2/nwCtVRC
 4nLTHKjDPCTmdN1nggRorMSZA+/YJzAqzELy2Cwkj81CuGEBI/MqRvHU0uLc9NRio7zUcr3i
 xNzi0rx0veT83E2MwMR3+t/xLzsYl7/6qHeIkYmD8RCjBAezkgjv9sSOJCHelMTKqtSi/Pii
 0pzU4kOM0hwsSuK8yZkbEoUE0hNLUrNTUwtSi2CyTBycUg1ME1c2nvpzi/v/tWMhJUovEmc2
 L3d0nnPH3EdU4xebf9TlV3dbf34POjnRzq82R6aktEhF6olrQZr4IQGj9KlHz/arfpbTsP21
 xzLJV+jc73rhMMn7n50XXWAwmMlWKMf4582KWU3B7PeWb3qhz3ZvZY/IVFvTb/OzlJ326equ
 ZQqzLqr5+l/v394ll79tOSX279OMu2yF+mpFBtaRfy9qv89L9L71TKA2gDP/Q+7E+eu5OxZF
 /v2iJF+u9vv29fPNq86v+rOu7sa6QPnt5qk6dXvOS3QIhMjOP94XFKX3XLZyl94RGduUDAFu
 6VMTgp5rH5Y9L+PUeXJVDOOEZwXVQfcfzBANVm08qv+kapa1EktxRqKhFnNRcSIArmFOWesD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xu7rOm7uTDOYclLFYfbefzeL32fPM
 FnvfzWa1uPCjkcni5oGdTBZ7Fk1isli5+iiTxZP1s5gteg58YLH423WPyWLvLW2Ly7vmsFnM
 X/aU3eLz0hZ2i7aNXxkd+D3+nVjD5nH5bKnHplWdbB6bl9R77L7ZwOaxs/U+q8f7fVfZPPq2
 rGL0WL/lKovH5tPVHp83yXm0H+hmCuCJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2
 j7UyMlXSt7NJSc3JLEst0rdL0MtouNXKUnBQu6J351u2BsZ+5S5GTg4JAROJ/4dmsnUxcnEI
 CSxllDjQupUVIiEhcXthEyOELSzx51oXVNEzRolfSzqBijg42AS0JBo72UHiIgKdjBJHV5xi
 AXGYBf4zSnx+swVskrCAjcS6rQtZQGwWAVWJS0veg03lFbCUODLlB9Q2eYmZl76zgwxlFtCU
 WL9LH6JEUOLkzCdgrcxAJc1bZzNPYOSfhVA1C0nVLCRVCxiZVzGKpJYW56bnFhvqFSfmFpfm
 pesl5+duYgRG6LZjPzfvYJz36qPeIUYmDsZDjBIczEoivNsTO5KEeFMSK6tSi/Lji0pzUosP
 MZoCXT2RWUo0OR+YIvJK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODil
 GpiMNZ0Z5C/aJl/Z3j5tWwKnxuaXE7QDWWMWp+lk7D/J8+3wbJVF/fF3Dov2qKzfbW3/W7Zt
 0t+Y/+Xe8txvP7HEyCmfW1bK1zaVNXrHXvOP2+8l8exqvDKzp0YvY4esnax/ZrxWoQZDfUe6
 QQJby5ltc/tv/La3ac7uFr517NdW3+OGL5ea7Lu2V+j1PiMupsrnidOPbXy4MN9/9vxNQYuN
 8zZETXJcNC1b49mOm37HDaLXZnIGJLMrv3N4sD6Di1ni4JuDGu1mrc5hiTfvnT/hJ700mYH9
 Lfv+hs3n8z5d7qjnL6gOmnnZWFNY7VrG1wK97DCTlDdyPb9EZPV3ipnNnH0u4+Nbj82Xq+ui
 liuxFGckGmoxFxUnAgDtDJstWQMAAA==
X-CMS-MailID: 20220523161603eucas1p1719a165f769b5ad69717ad9b5f4decc3
X-Msg-Generator: CA
X-RootMTR: 20220523161603eucas1p1719a165f769b5ad69717ad9b5f4decc3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220523161603eucas1p1719a165f769b5ad69717ad9b5f4decc3
References: <CGME20220523161603eucas1p1719a165f769b5ad69717ad9b5f4decc3@eucas1p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [dm-devel] [PATCH v5 0/7] support non power of 2 zoned devices
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, gost.dev@samsung.com,
 jiangbo.365@bytedance.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com,
 dsterba@suse.com, jaegeuk@kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,
  The previous revision ended up leading to a new direction to add npo2
  device support as a dm target instead of adding support to filesystems
  directly[0]. I would like to hear some inputs from the community,
  especially from Christoph and Mike Snitzer about this approach.

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
proactively not allow npo2 zone sizes until proper support is added [1].

There were two efforts previously to add support to npo2 devices: 1) via
device level emulation [2] but that was rejected with a final conclusion
to add support for non po2 zoned device in the complete stack[3] 2)
adding support to the complete stack by removing the constraint in the
block layer and NVMe layer with support to btrfs, zonefs, etc which was
rejected with a conclusion to add a dm target for FS support [0]
to reduce the regression impact.

- Patchset description:

The support is planned to be added in two phases:
- Add npo2 support to block, nvme layer and necessary stop gap patches
  in the filesystems
- Add dm target for npo2 devices so that they are presented as a po2
  device to filesystems

This patchset addresses the first phase for adding support to npo2
devices.

Patches 1-2 deals with removing the po2 constraint from the
block layer.

Patches 3-4 deals with removing the constraint from nvme zns.

Patch 5-6 removes the po2 contraint in null blk

Patches 7 adds conditions to not allow non power of 2 devices in
DM.

The patch series is based on linux-next tag: next-20220520

- Future work
Add DM target for npo2 devices to be presented as a po2 device.

[0] https://lore.kernel.org/lkml/PH0PR04MB74166C87F694B150A5AE0F009BD09@PH0PR04MB7416.namprd04.prod.outlook.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=6afcf6493578e77528abe65ab8b12f3e1c16749f
[2] https://lore.kernel.org/all/20220310094725.GA28499@lst.de/T/
[3] https://lore.kernel.org/all/20220315135245.eqf4tqngxxb7ymqa@unifi/

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

Changes since v3:
- Make superblock mirror align with the existing superblock log offsets
  (David)
- DM change return value and remove extra newline
- Optimize null blk zone index lookup with shift for po2 zone size

Changes since v4:
- Remove direct filesystems support for npo2 devices (Johannes, Hannes,
  Damien)

Luis Chamberlain (1):
  dm-zoned: ensure only power of 2 zone sizes are allowed

Pankaj Raghav (6):
  block: make blkdev_nr_zones and blk_queue_zone_no generic for npo2
    zsze
  block: allow blk-zoned devices to have non-power-of-2 zone size
  nvme: zns: Allow ZNS drives that have non-power_of_2 zone size
  nvmet: Allow ZNS target to support non-power_of_2 zone sizes
  null_blk: allow non power of 2 zoned devices
  null_blk: use zone_size_sects_shift for power of 2 zoned devices

 block/blk-core.c                  |  3 +--
 block/blk-zoned.c                 | 38 +++++++++++++++++++++++--------
 drivers/block/null_blk/main.c     |  5 ++--
 drivers/block/null_blk/null_blk.h |  6 +++++
 drivers/block/null_blk/zoned.c    | 20 ++++++++++------
 drivers/md/dm-zone.c              | 12 ++++++++++
 drivers/nvme/host/zns.c           | 21 +++++++++--------
 drivers/nvme/target/zns.c         |  2 +-
 include/linux/blkdev.h            | 36 ++++++++++++++++++++++++++++-
 9 files changed, 111 insertions(+), 32 deletions(-)

-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


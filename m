Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B82DD2E9DE2
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 20:04:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-glBGyFSmNFWrC-yxG78y2w-1; Mon, 04 Jan 2021 14:04:49 -0500
X-MC-Unique: glBGyFSmNFWrC-yxG78y2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B077F1074642;
	Mon,  4 Jan 2021 19:04:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ABB7707B6;
	Mon,  4 Jan 2021 19:04:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 413661809CA2;
	Mon,  4 Jan 2021 19:04:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104Am3OZ002606 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 05:48:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 13EA02166B30; Mon,  4 Jan 2021 10:48:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB2D2166B2F
	for <dm-devel@redhat.com>; Mon,  4 Jan 2021 10:48:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50619185A7BC
	for <dm-devel@redhat.com>; Mon,  4 Jan 2021 10:48:00 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-262-uHZepsG4OTKMshckKABkEw-1; Mon, 04 Jan 2021 05:47:51 -0500
X-MC-Unique: uHZepsG4OTKMshckKABkEw-1
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
	20210104104748epoutp01a0066ac32683d28562a9faba5c0ecc4f~XAbUFDlPl2317123171epoutp019
	for <dm-devel@redhat.com>; Mon,  4 Jan 2021 10:47:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
	20210104104748epoutp01a0066ac32683d28562a9faba5c0ecc4f~XAbUFDlPl2317123171epoutp019
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20210104104748epcas5p35140f9de7456e26b75523b7131b32c20~XAbTXt3_F0252202522epcas5p3-;
	Mon,  4 Jan 2021 10:47:48 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1E.DB.15682.352F2FF5; Mon,  4 Jan 2021 19:47:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20210104104237epcas5p1ed2d167f50060eb0567ade5d9a1df701~XAWydkdLf2312423124epcas5p1z;
	Mon,  4 Jan 2021 10:42:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20210104104237epsmtrp287e4dee44b7d8db23bbf16ad41c2100a~XAWycdM_m2765327653epsmtrp2N;
	Mon,  4 Jan 2021 10:42:37 +0000 (GMT)
X-AuditID: b6c32a49-8bfff70000013d42-da-5ff2f2534d7b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	35.49.13470.D11F2FF5; Mon,  4 Jan 2021 19:42:37 +0900 (KST)
Received: from localhost.localdomain (unknown [107.110.206.5]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20210104104233epsmtip1173332a6b503fc6f3517b19376a68251~XAWuBs05c1774617746epsmtip1T;
	Mon,  4 Jan 2021 10:42:32 +0000 (GMT)
From: SelvaKumar S <selvakuma.s1@samsung.com>
To: linux-nvme@lists.infradead.org
Date: Mon,  4 Jan 2021 16:11:56 +0530
Message-Id: <20210104104159.74236-1-selvakuma.s1@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGKsWRmVeSWpSXmKPExsWy7bCmum7wp0/xBg++m1qsvtvPZjHtw09m
	i9b2b0wWe9/NZrXYs2gSk8XK1UeZLB7f+cxu8bfrHpPF0f9v2SwmHbrGaLH3lrbF5V1z2Czm
	L3vKbtF9fQebxfLj/5gsJnZcZbLY9ns+s8WVKYuYLda9fs9i8eD9dXaL1z9Oslm0bfzK6CDm
	cfmKt8fOWXfZPc7f28jicflsqcemVZ1sHpuX1HvsvtnA5vHx6S0Wj/f7rrJ59G1Zxeix+XS1
	x+dNch7tB7qZAnijuGxSUnMyy1KL9O0SuDIa9txlK9itVHG8bzJ7A+Nx6S5GTg4JAROJ/hM/
	2LsYuTiEBHYzSvxcv5wFwvnEKPF77ieozDdGifV717LDtDzvXMoMkdjLKDFrwls2COczo8TZ
	/ddZQKrYBHQlri3ZBGaLCChJ/F3fBDaXWeAms8SlX5/ARgkLGEsc6rnKCmKzCKhK3N+0HqyB
	V8BW4snf20wQ6+QlZl76zg4RF5Q4OfMJWA0zULx562xmiJp2TonZy20gbBeJJycXQJ0qLPHq
	+BYoW0ri87u9bBB2ucSzzmlQ8xsYJfrel0PY9hIX9/wFinMAzdeUWL9LHyIsKzH11DomiLV8
	Er2/n0C18krsmPcErFxCQE3i1HYziLCMxIfDu6A2eUh8m/obrFxIIFbi9c6PrBMY5WcheWYW
	kmdmISxewMi8ilEytaA4Nz212LTAMC+1XK84Mbe4NC9dLzk/dxMjOGlqee5gvPvgg94hRiYO
	xkOMEhzMSiK8FRc+xAvxpiRWVqUW5ccXleakFh9ilOZgURLn3WHwIF5IID2xJDU7NbUgtQgm
	y8TBKdUATMSG6nM3bFfnilForbE/KLvz14T7FTmb/q6YeW7BzLP2i67GWeit1jj0xOf1bx8H
	2Xgr/67D83w+xd9v/ZM/u9q4tO6u9+wft/azzwlpMrv7IGTjzFkqc1S/LDr28Ngjy7CWyOpF
	hxlPGgi8UTab/Mgi+L0jx48PU3V/6scZr/+2b6bai/by/uTQmL3nli8sNxI5K1MlJy93u3/9
	/1AH6/75NT1XHNJOHC9aYHso6syn9YGX55uEck016dq7Vu303s+XfpivrWGcm/bx8N70+GKj
	62/sJLtmXvjZwp7P8fKpTcJuMa0DvtpH7kkbpaQ/d9zIfDXwS7ntqeCdcyKSnldcj02eUG3T
	9ubml93LLyqxFGckGmoxFxUnAgB9ywkyCQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsWy7bCSnK7sx0/xBse6NSxW3+1ns5j24Sez
	RWv7NyaLve9ms1rsWTSJyWLl6qNMFo/vfGa3+Nt1j8ni6P+3bBaTDl1jtNh7S9vi8q45bBbz
	lz1lt+i+voPNYvnxf0wWEzuuMlls+z2f2eLKlEXMFutev2exePD+OrvF6x8n2SzaNn5ldBDz
	uHzF22PnrLvsHufvbWTxuHy21GPTqk42j81L6j1232xg8/j49BaLx/t9V9k8+rasYvTYfLra
	4/MmOY/2A91MAbxRXDYpqTmZZalF+nYJXBkNe+6yFexWqjjeN5m9gfG4dBcjJ4eEgInE886l
	zF2MXBxCArsZJf61djBCJGQk1t7tZIOwhSVW/nvODlH0kVHi2c79rCAJNgFdiWtLNrGA2CIC
	ShJ/1zexgBQxC3xmlpi/qw0sISxgLHGo5ypYA4uAqsT9TevB4rwCthJP/t5mgtggLzHz0nd2
	iLigxMmZT4BqOIAGqUusnycEEmYGKmneOpt5AiP/LCRVsxCqZiGpWsDIvIpRMrWgODc9t9iw
	wDAvtVyvODG3uDQvXS85P3cTIzhitTR3MG5f9UHvECMTB+MhRgkOZiUR3ooLH+KFeFMSK6tS
	i/Lji0pzUosPMUpzsCiJ817oOhkvJJCeWJKanZpakFoEk2Xi4JRqYDp+rChxU5rf+8YrE1Zv
	OPq1auO5+x1/fY85LElo2Fm6STOnsHlhaOkp+7k5bl96hK5f2rlK7373stWfeJ0nXf0uLns+
	u9smanvCHPll/it2x4nf2LKjebKa5YXZJ0raeY8nVGS7dX6oWNay3eEDS7K/Tdj1rLmtmk0v
	/Jv2MfROvBpht01VpertK52jV6O9njR/V656uvNqUUd41Aqlin+MW+duWPyK43u2+Y6J/n/5
	OBiyWK2br+RvVDR+4bl70d+DCi6JJ/5svn+WTyHDlf/6df01gTfXv+pedMmFK5PBzYJ/wZV7
	UzW3LKjI1zZwORO7M9v6yRWfL8v3SMle1AupnLTTdfNpCSHf+oilHUZKLMUZiYZazEXFiQCj
	gKFmRwMAAA==
X-CMS-MailID: 20210104104237epcas5p1ed2d167f50060eb0567ade5d9a1df701
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210104104237epcas5p1ed2d167f50060eb0567ade5d9a1df701
References: <CGME20210104104237epcas5p1ed2d167f50060eb0567ade5d9a1df701@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 104Am3OZ002606
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 14:03:12 -0500
Cc: axboe@kernel.dk, damien.lemoal@wdc.com,
	SelvaKumar S <selvakuma.s1@samsung.com>, sagi@grimberg.me,
	linux-scsi@vger.kernel.org, selvajove@gmail.com,
	Johannes.Thumshirn@wdc.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, nj.shetty@samsung.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	mpatocka@redhat.com, joshi.k@samsung.com,
	martin.petersen@oracle.com, kbusch@kernel.org,
	javier.gonz@samsung.com, hch@lst.de, bvanassche@acm.org
Subject: [dm-devel] [RFC PATCH v4 0/3] add simple copy support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset tries to add support for TP4065a ("Simple Copy Command"),
v2020.05.04 ("Ratified")

The Specification can be found in following link.
https://nvmexpress.org/wp-content/uploads/NVM-Express-1.4-Ratified-TPs-1.zip

Simple copy command is a copy offloading operation and is  used to copy
multiple contiguous ranges (source_ranges) of LBA's to a single destination
LBA within the device reducing traffic between host and device.

This implementation doesn't add native copy offload support for stacked
devices rather copy offload is done through emulation. Possible use
cases are F2FS gc and BTRFS relocation/balance.

*blkdev_issue_copy* takes source bdev, no of sources, array of source
ranges(values are in bytes), destination bdev and destination offset(in bytes).
If both source and destination block devices are same and copy_offload = 1,
then copy is done through native copy offloading. Copy emulation is used
in other cases.

As SCSI XCOPY can take two different block devices and no of source range is
equal to 1, this interface can be extended in future to support SCSI XCOPY.

For devices supporting native simple copy, attach the control information
as payload to the bio and submit to the device. For devices without native
copy support, copy emulation is done by reading each source range into memory
and writing it to the destination.

Following limits are added to queue limits and are exposed in sysfs
to userspace
	- *copy_offload* controls copy_offload. set 0 to disable copy
		offload, 1 to enable native copy offloading support.
	- *max_copy_sectors* limits the sum of all source_range length
	- *max_copy_nr_ranges* limits the number of source ranges
	- *max_copy_range_sectors* limit the maximum number of sectors
		that can constitute a single source range.

	max_copy_sectors = 0 indicates the device doesn't support copy
offloading.

	*copy offload* sysfs entry is configurable and can be used toggle
between emulation and native support depending upon the usecase.

Changes from v3

1. gfp_flag fixes.
2. Export bio_map_kern() and use it to allocate and add pages to bio.
3. Move copy offload, reading to buf, writing from buf to separate functions.
4. Send read bio of copy offload by chaining them and submit asynchronously.
5. Add gendisk->part0 and part->bd_start_sect changes to blk_check_copy().
6. Move single source range limit check to blk_check_copy()
7. Rename __blkdev_issue_copy() to blkdev_issue_copy and remove old helper.
8. Change blkdev_issue_copy() interface generic to accepts destination bdev
	to support XCOPY as well.
9. Add invalidate_kernel_vmap_range() after reading data for vmalloc'ed memory.
10. Fix buf allocoation logic to allocate buffer for the total size of copy.
11. Reword patch commit description.

Changes from v2

1. Add emulation support for devices not supporting copy.
2. Add *copy_offload* sysfs entry to enable and disable copy_offload
	in devices supporting simple copy.
3. Remove simple copy support for stacked devices.

Changes from v1:

1. Fix memory leak in __blkdev_issue_copy
2. Unmark blk_check_copy inline
3. Fix line break in blk_check_copy_eod
4. Remove p checks and made code more readable
5. Don't use bio_set_op_attrs and remove op and set
   bi_opf directly
6. Use struct_size to calculate total_size
7. Fix partition remap of copy destination
8. Remove mcl,mssrl,msrc from nvme_ns
9. Initialize copy queue limits to 0 in nvme_config_copy
10. Remove return in QUEUE_FLAG_COPY check
11. Remove unused OCFS

SelvaKumar S (3):
  block: export bio_map_kern()
  block: add simple copy support
  nvme: add simple copy support

 block/blk-core.c          |  94 ++++++++++++++--
 block/blk-lib.c           | 223 ++++++++++++++++++++++++++++++++++++++
 block/blk-map.c           |   3 +-
 block/blk-merge.c         |   2 +
 block/blk-settings.c      |  10 ++
 block/blk-sysfs.c         |  50 +++++++++
 block/blk-zoned.c         |   1 +
 block/bounce.c            |   1 +
 block/ioctl.c             |  43 ++++++++
 drivers/nvme/host/core.c  |  87 +++++++++++++++
 include/linux/bio.h       |   1 +
 include/linux/blk_types.h |  15 +++
 include/linux/blkdev.h    |  15 +++
 include/linux/nvme.h      |  43 +++++++-
 include/uapi/linux/fs.h   |  13 +++
 15 files changed, 589 insertions(+), 12 deletions(-)

-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


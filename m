Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C1740954
	for <lists+dm-devel@lfdr.de>; Wed, 28 Jun 2023 07:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687931796;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SmtzvgDk/1JrIVE0Eqw12kRnJpG1UQn+sySrLY9EeXg=;
	b=J6bxqWK0P3YMJKLdT4seSBZTSIT+2oKk2Qu202YPGO9W93A8KE8I/vTqfFCZh1/WKiF0D2
	R3lvxFWnS5v0h8Ve1GQGupCdJJ4UUzg7cYQXCGYPtL2PcflobCPVkBwS8x20HRdporWeMR
	4RjQWmQ3wt0LZp+25gJsd5YXmyrZJxk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-L9skL6v0O-C8Tch0yslsjQ-1; Wed, 28 Jun 2023 01:56:34 -0400
X-MC-Unique: L9skL6v0O-C8Tch0yslsjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E51D58ED600;
	Wed, 28 Jun 2023 05:56:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA738200C0CD;
	Wed, 28 Jun 2023 05:56:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E31201946A7D;
	Wed, 28 Jun 2023 05:55:59 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0DD04194658C
 for <dm-devel@listman.corp.redhat.com>; Wed, 28 Jun 2023 05:55:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B815EF5CCB; Wed, 28 Jun 2023 05:55:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B02EDF41B9
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DFAC185A78F
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:05 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-RxLfRRrIN0OC_WTdXTmnQg-1; Wed, 28 Jun 2023 01:55:03 -0400
X-MC-Unique: RxLfRRrIN0OC_WTdXTmnQg-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230628055500epoutp03fcbcabb64aca6404349379be8524f491~svPBAQgll1625316253epoutp03b
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230628055500epoutp03fcbcabb64aca6404349379be8524f491~svPBAQgll1625316253epoutp03b
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20230628055459epcas5p2212b46d00ee1c65b745f574bb102ffa3~svPAYejX61872218722epcas5p2s;
 Wed, 28 Jun 2023 05:54:59 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4QrW4y3zGTz4x9Q9; Wed, 28 Jun
 2023 05:54:58 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E9.6E.06099.23BCB946; Wed, 28 Jun 2023 14:54:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230627183950epcas5p1b924785633509f612ffa5d9616bfe447~smBhjHt543272832728epcas5p1D;
 Tue, 27 Jun 2023 18:39:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230627183950epsmtrp2b960dbfe342e1c8adc07d1bb712d48b6~smBhhtUpl2845228452epsmtrp2I;
 Tue, 27 Jun 2023 18:39:50 +0000 (GMT)
X-AuditID: b6c32a4b-d308d700000017d3-51-649bcb32538c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 09.39.34491.6FC2B946; Wed, 28 Jun 2023 03:39:50 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230627183946epsmtip218572e571ea16038ddda1594e34e3a6e~smBd8k8en0383803838epsmtip2Y;
 Tue, 27 Jun 2023 18:39:46 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>
Date: Wed, 28 Jun 2023 00:06:14 +0530
Message-Id: <20230627183629.26571-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHOfe2t4VZcwEnhxoBazQRhLZa4EBESCTbzSAL6kaWJQvr6B1l
 QNv1oWMzGayCgcpjICwWImw0QEHA8ZKHFYTJo8yxyQBBcThgQwuIEJiG1yiFzf8+v9f39zg5
 bNwpj8Vlx8rUtFImjucRDozGziOe3sf6CiSCpXYuqjF34ahyLItAls4FgPLnX+Fosv0SQAOT
 u9F4WzAyzRUw0Uh7M4Zu/ZCDIWPlXQzldAwBNDWox5Bp1At9n2pgoFumXgYaaCkkUFHpFAvp
 hpsIVNa9jqGOXC2GmiaTAWpcKcJRteU5A/WM7kP9a91MtPKykAjZRw38HkY168dYVP/jHxlU
 XbknNXBPQ9VWpBFUneFrqnUkiaBKMnOZVIZ2jqBeTI0yqOe3Bwkqs74CUHV9X1GLtW5U7eQs
 FkF+GHdCSosltNKDlkXLJbGymCBe2NmoU1G+fgKhtzAA+fM8ZOIEOogXGh7h/VZs/OZheB7n
 xPGaTVeEWKXi8U+eUMo1atpDKlepg3i0QhKvECl8VOIElUYW4yOj1YFCgeCY72bix3HSefNN
 hkJ36ovl3mFGErgjTAf2bEiKYNeGGbOyE9kK4NPCd9KBwyYvANj98GdgM5YBHNGNsnYqcmaG
 WLaACUBLWdW2kYLBJZ2OmQ7YbIL0gn0bbKt/D5mEwxutJVtSOGnAoXFmfivJmfSH9Tc5VlUG
 eQjmr5YzrcwhA6HuxSXCmgJJPsz6w9HmdoS9VycZVsZJd6htKMCtkpBss4eNww+YtulC4X1D
 G2ZjZ/isu357ai5cnDMRNj4PjVfKCVvxRQD1w3pgCwTDFHMWbm2Mk0dgTQvf5t4P88zVmK3x
 bpixMrmtz4FN13b4ILxeU7yt7wqH/kneZgq2l3YxbPf9CGZa0pjZwF3/2j761/bR/9+5GOAV
 wJVWqBJiaJWv4riMPv/fw0bLE2rB1v/wDGsCf47P+3QAjA06AGTjvD2cvS+/kzhxJOLEL2ml
 PEqpiadVHcB388bf4tw3o+WbH0ymjhKKAgQiPz8/UcBxPyHPhfPbcIbEiYwRq+k4mlbQyp06
 jG3PTcLoqtnTWhee9t0wx18dRM9W1/a6Hxi+d8OETUssgw+/ifwspAuU7uplH1VeDPdMrp9e
 TZqoIvrnP4WLIc2KDGOs3vlzSqwYH/Pq4bZzDRdKLXdcc0LPGX85VJo2/ap67aflsr8f5WSx
 Ii/wD0hMlgeHP4jkC8bXg8rzmi4XZvbzNfNhj9zWZ0diznyS9UanXaZri2yi+Gp1sGitjb3m
 Ul3k2njafC2/csXe/6idCfY5p+QqmysWjHaWxPC3/4o3SZ9SopKy1lw/t+sNgQ0th3t7lg4+
 Lnmy6/aq9MzMWWVS4nveAw3C1qHU7Pttq+93pmpbsi9PGMQbT/bfVVfifaKT/TyGSioWeuJK
 lfhfO+84AagEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsWy7bCSvO43ndkpBh9/a1msP3WM2WL13X42
 i9eHPzFaTPvwk9niyYF2RovLT/gsHuy3t9j7bjarxc0DO5ks9iyaxGSxcvVRJotJh64xWjy9
 OovJYu8tbYuFbUtYLPbsPclicXnXHDaL+cueslt0X9/BZrH8+D8mi0OTm5ksdjxpZLTY9ns+
 s8W61+9ZLE7ckrY4//c4q8XvH3PYHKQ9Ll/x9tg56y67x/l7G1k8Nq/Q8rh8ttRj06pONo/N
 S+o9dt9sYPNY3DeZ1aO3+R2bx8ent1g83u+7yubRt2UVo8fm09UenzfJeWx68pYpQCCKyyYl
 NSezLLVI3y6BK+PDqe0sBd3OFd9OXmdpYDxo2MXIySEhYCIx6c019i5GLg4hgd2MErPbFrJC
 JCQllv09wgxhC0us/PccqqiZSeL2pFdMXYwcHGwC2hKn/3OAxEUEupglOne+YwFxmAW2MUt8
 +PCFHaRIWMBcYst2XpBBLAKqEtP+rABbwCtgJdH9sZ0NpERCQF+i/74gRFhQ4uTMJywgYWYB
 dYn184RAwswC8hLNW2czT2Dkn4WkahZC1SwkVQsYmVcxSqYWFOem5xYbFhjmpZbrFSfmFpfm
 pesl5+duYgRHvZbmDsbtqz7oHWJk4mA8xCjBwawkwiv2Y3qKEG9KYmVValF+fFFpTmrxIUZp
 DhYlcV7xF70pQgLpiSWp2ampBalFMFkmDk6pBqbFGSEnPmx6rm9xf3nM7jj+yWsnhq0puBwm
 lsTfUbrF/Rirw/8HLPIezuteSvcx/wuNYdzuFHBVf+J+qWxGnYbOs0delHjxC8vpK39+MYn3
 Ld8JS9vWPd71Tl1/np7bt5+xkZHj8lfxL0y/f4fdv/4yot1QJnzalv0fOd4wOyqJLz+d+Urh
 pe/7SZ5nCpfcfDZPZ6LUws1PpzALz50qPN9h3z7f5lXbv20OZf9+84/pQg6eI/oCrrubryyc
 5/tvxonLSy92Mhxacpdv3e7TfzRbjbc/+FXhvnTJ8YWKh6+vZXd+ub4reeNtKf3dra7tcwVb
 I7kyRZhlrVzn6217WyG/skVS5X/qwcWl/z2ue/huVGIpzkg01GIuKk4EALJIwBdpAwAA
X-CMS-MailID: 20230627183950epcas5p1b924785633509f612ffa5d9616bfe447
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230627183950epcas5p1b924785633509f612ffa5d9616bfe447
References: <CGME20230627183950epcas5p1b924785633509f612ffa5d9616bfe447@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [dm-devel] [PATCH v13 0/9] Implement copy offload support
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
Cc: linux-nvme@lists.infradead.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org, djwong@kernel.org,
 nitheshshetty@gmail.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, dlemoal@kernel.org,
 martin.petersen@oracle.com, linux-fsdevel@vger.kernel.org,
 gost.dev@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The patch series covers the points discussed in past and most recently
in LSFMM'23[0].
We have covered the initial agreed requirements in this patchset and
further additional features suggested by community.

This is next iteration of our previous patchset v12[1].
We have changed the token based approach to request based approach,
instead of storing the info in token. We now try to merge the copy bio's
in request layer and send it to driver.
So this design works only for request based storage drivers.

Overall series supports:
========================
	1. Driver
		- NVMe Copy command (single NS, TP 4065), including support
		in nvme-target (for block and file backend).

	2. Block layer
		- Block-generic copy (REQ_OP_COPY_DST/SRC), operation with
                  interface accommodating two block-devs
                - Merging copy requests in request layer
		- Emulation, for in-kernel user when offload is natively 
                absent
		- dm-linear support (for cases not requiring split)

	3. User-interface
		- copy_file_range

Testing
=======
	Copy offload can be tested on:
	a. QEMU: NVME simple copy (TP 4065). By setting nvme-ns
		parameters mssrl,mcl, msrc. For more info [2].
	b. Null block device
        c. NVMe Fabrics loopback.
	d. blktests[3] (tests block/035-038, nvme/050-053)

	Emulation can be tested on any device.

	fio[4].

Infra and plumbing:
===================
        We populate copy_file_range callback in def_blk_fops. 
        For devices that support copy-offload, use __blkdev_copy_offload to
        achieve in-device copy.
        However for cases, where device doesn't support offload,
        fallback to generic_copy_file_range.
        For in-kernel users (like NVMe fabrics), we use blkdev_issue_copy
        which implements its own emulation, as fd is not available.
        Modify checks in generic_copy_file_range to support block-device.

Blktests[3]
======================
	tests/block/035,036: Runs copy offload and emulation on block
                              device.
	tests/block/037,038: Runs copy offload and emulation on null
                              block device.
        tests/nvme/050-053: Create a loop backed fabrics device and
                              run copy offload and emulation.

Future Work
===========
	- loopback device copy offload support
	- upstream fio to use copy offload
	- upstream blktest to test copy offload

	These are to be taken up after this minimal series is agreed upon.

Additional links:
=================
	[0] https://lore.kernel.org/linux-nvme/CA+1E3rJ7BZ7LjQXXTdX+-0Edz=zT14mmPGMiVCzUgB33C60tbQ@mail.gmail.com/
            https://lore.kernel.org/linux-nvme/f0e19ae4-b37a-e9a3-2be7-a5afb334a5c3@nvidia.com/
            https://lore.kernel.org/linux-nvme/20230113094648.15614-1-nj.shetty@samsung.com/
	[1] https://lore.kernel.org/linux-block/20230605121732.28468-1-nj.shetty@samsung.com/T/#m4db1801c86a5490dc736266609f8458fd52b9eb5
	[2] https://qemu-project.gitlab.io/qemu/system/devices/nvme.html#simple-copy
	[3] https://github.com/nitesh-shetty/blktests/tree/feat/copy_offload/v13
	[4] https://github.com/vincentkfu/fio/commits/copyoffload-3.35-v13

Changes since v12:
=================
        - block,nvme: Replaced token based approach with request based
          single namespace capable approach (Christoph Hellwig)

Changes since v11:
=================
        - Documentation: Improved documentation (Damien Le Moal)
        - block,nvme: ssize_t return values (Darrick J. Wong)
        - block: token is allocated to SECTOR_SIZE (Matthew Wilcox)
        - block: mem leak fix (Maurizio Lombardi)

Changes since v10:
=================
        - NVMeOF: optimization in NVMe fabrics (Chaitanya Kulkarni)
        - NVMeOF: sparse warnings (kernel test robot)

Changes since v9:
=================
        - null_blk, improved documentation, minor fixes(Chaitanya Kulkarni)
        - fio, expanded testing and minor fixes (Vincent Fu)

Changes since v8:
=================
        - null_blk, copy_max_bytes_hw is made config fs parameter
          (Damien Le Moal)
        - Negative error handling in copy_file_range (Christian Brauner)
        - minor fixes, better documentation (Damien Le Moal)
        - fio upgraded to 3.34 (Vincent Fu)

Changes since v7:
=================
        - null block copy offload support for testing (Damien Le Moal)
        - adding direct flag check for copy offload to block device,
	  as we are using generic_copy_file_range for cached cases.
        - Minor fixes

Changes since v6:
=================
        - copy_file_range instead of ioctl for direct block device
        - Remove support for multi range (vectored) copy
        - Remove ioctl interface for copy.
        - Remove offload support in dm kcopyd.

Changes since v5:
=================
	- Addition of blktests (Chaitanya Kulkarni)
        - Minor fix for fabrics file backed path
        - Remove buggy zonefs copy file range implementation.

Changes since v4:
=================
	- make the offload and emulation design asynchronous (Hannes
	  Reinecke)
	- fabrics loopback support
	- sysfs naming improvements (Damien Le Moal)
	- use kfree() instead of kvfree() in cio_await_completion
	  (Damien Le Moal)
	- use ranges instead of rlist to represent range_entry (Damien
	  Le Moal)
	- change argument ordering in blk_copy_offload suggested (Damien
	  Le Moal)
	- removed multiple copy limit and merged into only one limit
	  (Damien Le Moal)
	- wrap overly long lines (Damien Le Moal)
	- other naming improvements and cleanups (Damien Le Moal)
	- correctly format the code example in description (Damien Le
	  Moal)
	- mark blk_copy_offload as static (kernel test robot)
	
Changes since v3:
=================
	- added copy_file_range support for zonefs
	- added documentation about new sysfs entries
	- incorporated review comments on v3
	- minor fixes

Changes since v2:
=================
	- fixed possible race condition reported by Damien Le Moal
	- new sysfs controls as suggested by Damien Le Moal
	- fixed possible memory leak reported by Dan Carpenter, lkp
	- minor fixes

Changes since v1:
=================
	- sysfs documentation (Greg KH)
        - 2 bios for copy operation (Bart Van Assche, Mikulas Patocka,
          Martin K. Petersen, Douglas Gilbert)
        - better payload design (Darrick J. Wong)


Nitesh Shetty (9):
  block: Introduce queue limits for copy-offload support
  block: Add copy offload support infrastructure
  block: add emulation for copy
  fs, block: copy_file_range for def_blk_ops for direct block device
  nvme: add copy offload support
  nvmet: add copy command support for bdev and file ns
  dm: Add support for copy offload
  dm: Enable copy offload for dm-linear target
  null_blk: add support for copy offload

 Documentation/ABI/stable/sysfs-block |  33 +++
 Documentation/block/null_blk.rst     |   5 +
 block/blk-core.c                     |   5 +
 block/blk-lib.c                      | 384 +++++++++++++++++++++++++++
 block/blk-map.c                      |   4 +-
 block/blk-merge.c                    |  21 ++
 block/blk-settings.c                 |  24 ++
 block/blk-sysfs.c                    |  63 +++++
 block/blk.h                          |   9 +
 block/elevator.h                     |   1 +
 block/fops.c                         |  20 ++
 drivers/block/null_blk/main.c        |  85 +++++-
 drivers/block/null_blk/null_blk.h    |   1 +
 drivers/md/dm-linear.c               |   1 +
 drivers/md/dm-table.c                |  41 +++
 drivers/md/dm.c                      |   7 +
 drivers/nvme/host/constants.c        |   1 +
 drivers/nvme/host/core.c             |  79 ++++++
 drivers/nvme/host/trace.c            |  19 ++
 drivers/nvme/target/admin-cmd.c      |   9 +-
 drivers/nvme/target/io-cmd-bdev.c    |  62 +++++
 drivers/nvme/target/io-cmd-file.c    |  52 ++++
 drivers/nvme/target/nvmet.h          |   1 +
 fs/read_write.c                      |   7 +-
 include/linux/bio.h                  |   4 +-
 include/linux/blk_types.h            |  26 ++
 include/linux/blkdev.h               |  23 ++
 include/linux/device-mapper.h        |   5 +
 include/linux/nvme.h                 |  43 ++-
 include/uapi/linux/fs.h              |   3 +
 30 files changed, 1025 insertions(+), 13 deletions(-)


base-commit: 53cdf865f90ba922a854c65ed05b519f9d728424
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


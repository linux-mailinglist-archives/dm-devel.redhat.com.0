Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 263DD4B07FF
	for <lists+dm-devel@lfdr.de>; Thu, 10 Feb 2022 09:18:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-mx3Ad5gEPXiMpf82O_5Sqg-1; Thu, 10 Feb 2022 03:18:54 -0500
X-MC-Unique: mx3Ad5gEPXiMpf82O_5Sqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B29E10247C1;
	Thu, 10 Feb 2022 08:18:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 530DE7AB4F;
	Thu, 10 Feb 2022 08:18:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 154E81806D2D;
	Thu, 10 Feb 2022 08:18:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21A6DGdD023868 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Feb 2022 01:13:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 23FBF401E58; Thu, 10 Feb 2022 06:13:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FDE5401DBE
	for <dm-devel@redhat.com>; Thu, 10 Feb 2022 06:13:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03230811E80
	for <dm-devel@redhat.com>; Thu, 10 Feb 2022 06:13:16 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-576-Uh5IfRksPUW9SeGAdu5B6w-1; Thu, 10 Feb 2022 01:13:14 -0500
X-MC-Unique: Uh5IfRksPUW9SeGAdu5B6w-1
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id
	20220210061311epoutp024e5af8594c81b4db42bf9cc80b727162~SWATSboiR0229602296epoutp029
	for <dm-devel@redhat.com>; Thu, 10 Feb 2022 06:13:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
	20220210061311epoutp024e5af8594c81b4db42bf9cc80b727162~SWATSboiR0229602296epoutp029
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20220210061310epcas5p49faab99a9c416fc1551e406cd5be718a~SWASoKd0C0469004690epcas5p42;
	Thu, 10 Feb 2022 06:13:10 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4JvRHz28K8z4x9QT;
	Thu, 10 Feb 2022 06:13:03 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	17.51.06423.FECA4026; Thu, 10 Feb 2022 15:13:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20220209103706epcas5p491553ba70337e2d38b889e8b99e8fbd5~SF9cz5JM33189431894epcas5p4z;
	Wed,  9 Feb 2022 10:37:06 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20220209103706epsmtrp23a16fa5d1250fd3d330dbe7396c87c82~SF9cwr3wB2288022880epsmtrp2C;
	Wed,  9 Feb 2022 10:37:06 +0000 (GMT)
X-AuditID: b6c32a49-b01ff70000001917-a6-6204acef2a62
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	54.1F.08738.25993026; Wed,  9 Feb 2022 19:37:06 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20220209103701epsmtip273f8ca5a5569b854667e3d2cf52c30ee~SF9XmcAEB1539015390epsmtip2d;
	Wed,  9 Feb 2022 10:37:01 +0000 (GMT)
Date: Wed, 9 Feb 2022 16:02:06 +0530
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20220209103206.GD7698@test-zns>
MIME-Version: 1.0
In-Reply-To: <202202090703.U5riBMIn-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te1BUZRSf7967d3dplrnxqI8tgi5OhjzcJRY/VCwU8xJkGE0yTIgr3BYG
	2N3ZXbKoGXmIJgjCIorQCJGAPAwGyUFgLXmEyEOIR4hgyENUAgzMWCVol4XG/37n9/ud75zv
	nDk83KKFK+RFyjWsSi6Npkkz4kqTo6PLXAVxSFRQy0UNtxc4qHzkFInOPNbjaO76OAdpT+Vw
	0fTyWQL1Tpgj3WweB3UvJmBovHoFQw2FWgyVlrdgaKrkB4BOtHdjaOmeGLWszJCoM3UAoPL4
	KgxpGw1IN+SEGnRtBMovnuSi1N9rSXRtWoejktZlDGV+24+hrtwlEtVOJADUdLefQNOLbSRK
	PqnnvmfH9Pb5MZlJs1zmau4Il0kqGCaY3s5YprrsBMmk5i0TzOULR5iswRLA1N+OJ5nEjhac
	yZl/QjJpSbMk89fkEMHMXesnmfSaMhBgFRy1PYKVhrMqe1YepgiPlMu8aL/A0F2hEg+R2EXs
	ibbQ9nJpDOtF+/gHuLwfGW0YGG3/hTQ61kAFSNVqevOO7SpFrIa1j1CoNV40qwyPVrorXdXS
	GHWsXOYqZzVbxSKRm8RgPBgVkdH1G1dZ4/PlYFUFGQ9Oe6YAPg9S7vBO5V08BZjxLKh6AG/o
	qjCjYEHNAzg0ttckLACYWDjKXc8YKNQTJqEOwJ8nv+OagvsANk0lr6YT1AZ4YzwdpAAej6Sc
	YPsKz0hbUc6w98Tiqh+najlQpy3mGAVLyh+2n72EG/0Cg+l4j7WRFlAvw7ZzE4QR8yk3eFE7
	uPq8NeUAf7nSipkaesaH+myJCftA7fGuNd4SPmqtWWtaCBdmdaSxLqRSAVzs+AMzBTkAJmUk
	kSbXu7Cn4d/VbJyKgM1l5zkm3hZm3/xxjTeHac8n1ioIYO35dewAKyoL1t6xgQP/JKxhBs7l
	9RGmmSYDOJz4dgawy33hc7kvlDNhZ1hQP0/mGmaBU6/BkmWeCTrCyrrNBYBTBmxYpTpGxqol
	SrGcPfz/wsMUMdVg9Z42+daCkdHHro0A44FGAHk4bSW4eQQ/ZCEIl34Vx6oUoarYaFbdCCSG
	XWXiQuswheEg5ZpQsbunyN3Dw8Pd8x0PMf2qoF1WJbWgZFING8WySla1nofx+MJ4LNHfflE9
	tmVH/56jF8ee4gfZiufOxMjoyQM1h20fdvrmo5nljjd7juVjfX/bxIX0eBd92qHp9fzAqT3w
	Wd4rQUJB/DczIztlLqVkXGCQ0Pno4N5tsZf6Extnrhd1yxMyHCuzfLx/2uNvpo3z3cZvpM5g
	heFPhiVJn6BWzkJbsGzXiCTL4qP0pxs9P743HrQva6Kw9cL0GyEvudodcFB8SD869pYohDYX
	Tu+f6n8947OlO1ODRRNbg3xOe3+fwk97sIArg5ut/vw816003G/fuQez9mLu1/tv/bqzM6TI
	pW63V7f+alhb8UZan92QYglqBrM2WNuGhtxafnjZv6+z2UGkWYy6TxPqCKl4E65SS/8DDQZo
	DtgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42LZdlhJXjdoJnOSwaU3BhZ7bn5mtVh9t5/N
	YtqHn8wW7w8+ZrWY1D+D3eL1v+ksFpef8FnsfTeb1eLCj0Ymi8eb/jNZ7Fk0icli5eqjTBbP
	ly9mtOg8fYHJ4s9DQ4uj/9+yWZztvsZosbphA5PFpENA1t5b2hZ79p5ksZi/7Cm7Rff1HWwW
	+17vZbZYfvwfk8XEjqtMFudm/WGz2PGkkdHi8L2rLBavf5xks2jt+cnuIO9x+Yq3x8Tmd+we
	O2fdZfdoXnCHxePy2VKPTas62Ty6Z/9j8di8pN5j8o3ljB67bzaweTSdOcrsMePTFzaP3uZ3
	bB4fn95i8Xi/7yqbR9+WVYwBIlFcNimpOZllqUX6dglcGRc/9rMWfHGsWPF2LXsD41uzLkZO
	DgkBE4lri36ydDFycQgJ7GCUuLXnBgtEQlJi2d8jzBC2sMTKf8/ZIYqeMEosPnWODSTBIqAi
	ceJxH2MXIwcHm4C2xOn/HCBhEQEdicudP8DqmQV2sUq8vt/FCpIQFvCROD19LTNIPS9QUftF
	UYiZrYwSWzd+AavhFRCUODnzCdgRzAJaEjf+vWQCqWcWkJZY/g9sPqeAkcSKSTeYQGxRAWWJ
	A9uOM01gFJyFpHsWku5ZCN0LGJlXMUqmFhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIEpxUt
	rR2Me1Z90DvEyMTBeIhRgoNZSYT3VD1zkhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE
	0hNLUrNTUwtSi2CyTBycUg1Mq7Y5Pt0yz3sBs+zGIxccjpeuaLHfrGfhVSWqofpQL2rG0ZLz
	ll2PXpzXnpn3Zk7G9utSal+Wsk6YUar9uT7Ke0fscvHCzoQHCYH1JheXfvsqmrZ564egk5eE
	xHPqVD5xTZ5Ufkau3iD4zcpUrupZMTY9HzSXLZ1///G6VaV/93zkeaafev3y+5TWVX8dlpQm
	Bz4/uUvJSzduSqjLDa6FEZvZKzv71rjZKXtY53OVqp5Qf5fgsjS//O0b7lMyn5/PefBE+N+j
	vf/1lTIstu58LBM7jbk4L2Oj9LeDGvzZ88UMvoWsjT20JuhAubOFrXvCPuXqeN9ltgueXtzG
	H1HEZnHzpsuOqge55y8k2DZtVmIpzkg01GIuKk4EADQupw6aAwAA
X-CMS-MailID: 20220209103706epcas5p491553ba70337e2d38b889e8b99e8fbd5
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220209075901epcas5p3cff468deadd8ef836522f032bd4ed36c
References: <CGME20220209075901epcas5p3cff468deadd8ef836522f032bd4ed36c@epcas5p3.samsung.com>
	<202202090703.U5riBMIn-lkp@intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Feb 2022 03:18:24 -0500
Cc: djwong@kernel.org, linux-nvme@lists.infradead.org, clm@fb.com,
	dm-devel@redhat.com, osandov@fb.com, javier@javigon.com,
	bvanassche@acm.org, linux-scsi@vger.kernel.org,
	nitheshshetty@gmail.com, hch@lst.de, dsterba@suse.com,
	chaitanyak@nvidia.com, SelvaKumar S <selvakuma.s1@samsung.com>,
	msnitzer@redhat.com, josef@toxicpanda.com,
	linux-block@vger.kernel.org, mpatocka@redhat.com,
	kbusch@kernel.org, tytso@mit.edu, Frederick.Knight@netapp.com,
	axboe@kernel.dk, kbuild-all@lists.01.org, joshi.k@samsung.com,
	martin.petersen@oracle.com, kbuild@lists.01.org,
	arnav.dawn@samsung.com, jack@suse.com,
	linux-fsdevel@vger.kernel.org, lsf-pc@lists.linux-foundation.org
Subject: Re: [dm-devel] [PATCH v2 03/10] block: Add copy offload support
	infrastructure
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
	boundary="----8TtN9ZnHmYbjupaEpeShJ04PQlBV3ZvePY_ZWnFgjSBPeLtG=_5fb74_"

------8TtN9ZnHmYbjupaEpeShJ04PQlBV3ZvePY_ZWnFgjSBPeLtG=_5fb74_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 09, 2022 at 10:48:44AM +0300, Dan Carpenter wrote:
> Hi Nitesh,
> 
> url:    https://protect2.fireeye.com/v1/url?k=483798a4-17aca1b5-483613eb-0cc47a31cdbc-db5fd22936f47f46&q=1&e=e5a0c082-878d-4bbf-be36-3c8e34773475&u=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FNitesh-Shetty%2Fblock-make-bio_map_kern-non-static%2F20220207-231407
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
> config: i386-randconfig-m021-20220207 (https://protect2.fireeye.com/v1/url?k=24e309ba-7b7830ab-24e282f5-0cc47a31cdbc-9cc4e76aaefa8c0d&q=1&e=e5a0c082-878d-4bbf-be36-3c8e34773475&u=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20220209%2F202202090703.U5riBMIn-lkp%40intel.com%2Fconfig)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> block/blk-lib.c:272 blk_copy_offload() warn: possible memory leak of 'ctx'
> 
> vim +/ctx +272 block/blk-lib.c
>

acked

> 12a9801a7301f1 Nitesh Shetty 2022-02-07  185  int blk_copy_offload(struct block_device *src_bdev, int nr_srcs,
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  186  		struct range_entry *rlist, struct block_device *dst_bdev, gfp_t gfp_mask)
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  187  {
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  188  	struct request_queue *sq = bdev_get_queue(src_bdev);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  189  	struct request_queue *dq = bdev_get_queue(dst_bdev);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  190  	struct bio *read_bio, *write_bio;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  191  	struct copy_ctx *ctx;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  192  	struct cio *cio;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  193  	struct page *token;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  194  	sector_t src_blk, copy_len, dst_blk;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  195  	sector_t remaining, max_copy_len = LONG_MAX;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  196  	int ri = 0, ret = 0;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  197  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  198  	cio = kzalloc(sizeof(struct cio), GFP_KERNEL);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  199  	if (!cio)
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  200  		return -ENOMEM;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  201  	atomic_set(&cio->refcount, 0);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  202  	cio->rlist = rlist;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  203  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  204  	max_copy_len = min3(max_copy_len, (sector_t)sq->limits.max_copy_sectors,
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  205  			(sector_t)dq->limits.max_copy_sectors);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  206  	max_copy_len = min3(max_copy_len, (sector_t)sq->limits.max_copy_range_sectors,
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  207  			(sector_t)dq->limits.max_copy_range_sectors) << SECTOR_SHIFT;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  208  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  209  	for (ri = 0; ri < nr_srcs; ri++) {
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  210  		cio->rlist[ri].comp_len = rlist[ri].len;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  211  		for (remaining = rlist[ri].len, src_blk = rlist[ri].src, dst_blk = rlist[ri].dst;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  212  			remaining > 0;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  213  			remaining -= copy_len, src_blk += copy_len, dst_blk += copy_len) {
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  214  			copy_len = min(remaining, max_copy_len);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  215  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  216  			token = alloc_page(gfp_mask);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  217  			if (unlikely(!token)) {
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  218  				ret = -ENOMEM;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  219  				goto err_token;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  220  			}
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  221  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  222  			read_bio = bio_alloc(src_bdev, 1, REQ_OP_READ | REQ_COPY | REQ_NOMERGE,
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  223  					gfp_mask);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  224  			if (!read_bio) {
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  225  				ret = -ENOMEM;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  226  				goto err_read_bio;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  227  			}
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  228  			read_bio->bi_iter.bi_sector = src_blk >> SECTOR_SHIFT;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  229  			read_bio->bi_iter.bi_size = copy_len;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  230  			__bio_add_page(read_bio, token, PAGE_SIZE, 0);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  231  			ret = submit_bio_wait(read_bio);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  232  			if (ret) {
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  233  				bio_put(read_bio);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  234  				goto err_read_bio;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  235  			}
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  236  			bio_put(read_bio);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  237  			ctx = kzalloc(sizeof(struct copy_ctx), gfp_mask);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  238  			if (!ctx) {
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  239  				ret = -ENOMEM;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  240  				goto err_read_bio;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  241  			}
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  242  			ctx->cio = cio;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  243  			ctx->range_idx = ri;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  244  			ctx->start_sec = rlist[ri].src;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  245  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  246  			write_bio = bio_alloc(dst_bdev, 1, REQ_OP_WRITE | REQ_COPY | REQ_NOMERGE,
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  247  					gfp_mask);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  248  			if (!write_bio) {
> 
> Please call kfree(ctx) before the goto.
> 
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  249  				ret = -ENOMEM;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  250  				goto err_read_bio;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  251  			}
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  252  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  253  			write_bio->bi_iter.bi_sector = dst_blk >> SECTOR_SHIFT;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  254  			write_bio->bi_iter.bi_size = copy_len;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  255  			__bio_add_page(write_bio, token, PAGE_SIZE, 0);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  256  			write_bio->bi_end_io = bio_copy_end_io;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  257  			write_bio->bi_private = ctx;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  258  			atomic_inc(&cio->refcount);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  259  			submit_bio(write_bio);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  260  		}
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  261  	}
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  262  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  263  	/* Wait for completion of all IO's*/
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  264  	return cio_await_completion(cio);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  265  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  266  err_read_bio:
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  267  	__free_page(token);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  268  err_token:
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  269  	rlist[ri].comp_len = min_t(sector_t, rlist[ri].comp_len, (rlist[ri].len - remaining));
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  270  
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  271  	cio->io_err = ret;
> 12a9801a7301f1 Nitesh Shetty 2022-02-07 @272  	return cio_await_completion(cio);
> 12a9801a7301f1 Nitesh Shetty 2022-02-07  273  }
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://protect2.fireeye.com/v1/url?k=4cd82b59-13431248-4cd9a016-0cc47a31cdbc-7ef30a0abcb321a3&q=1&e=e5a0c082-878d-4bbf-be36-3c8e34773475&u=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org
> 
> 
> 

--
Thank you
Nitesh

------8TtN9ZnHmYbjupaEpeShJ04PQlBV3ZvePY_ZWnFgjSBPeLtG=_5fb74_
Content-Type: text/plain; charset="utf-8"


------8TtN9ZnHmYbjupaEpeShJ04PQlBV3ZvePY_ZWnFgjSBPeLtG=_5fb74_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel
------8TtN9ZnHmYbjupaEpeShJ04PQlBV3ZvePY_ZWnFgjSBPeLtG=_5fb74_--


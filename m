Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 952B54A6BA1
	for <lists+dm-devel@lfdr.de>; Wed,  2 Feb 2022 07:20:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-LQN8KWi1M2ytmC9xh7L8dQ-1; Wed, 02 Feb 2022 01:19:14 -0500
X-MC-Unique: LQN8KWi1M2ytmC9xh7L8dQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0B9818397D2;
	Wed,  2 Feb 2022 06:19:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C977108D4;
	Wed,  2 Feb 2022 06:19:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 596404A7CA;
	Wed,  2 Feb 2022 06:19:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21261w3X019942 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 01:01:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB2F6401E59; Wed,  2 Feb 2022 06:01:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E68C6401E4A
	for <dm-devel@redhat.com>; Wed,  2 Feb 2022 06:01:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7F131C05AF2
	for <dm-devel@redhat.com>; Wed,  2 Feb 2022 06:01:57 +0000 (UTC)
Received: from mailout1.w2.samsung.com (mailout1.w2.samsung.com
	[211.189.100.11]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-31-a5rWjxA_NZiYi2bOZqwnMA-1; Wed, 02 Feb 2022 01:01:54 -0500
X-MC-Unique: a5rWjxA_NZiYi2bOZqwnMA-1
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
	by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
	20220202060153usoutp01828a9d6888504cd921d9e88bcd3ace57~P4sJiMcHV1845518455usoutp01e;
	Wed,  2 Feb 2022 06:01:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
	20220202060153usoutp01828a9d6888504cd921d9e88bcd3ace57~P4sJiMcHV1845518455usoutp01e
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
	[203.254.195.111]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20220202060153uscas1p274d27045eba66b067a87573c0542e439~P4sJSO1K61178411784uscas1p2W;
	Wed,  2 Feb 2022 06:01:53 +0000 (GMT)
Received: from uscas1p1.samsung.com ( [182.198.245.206]) by
	ussmges2new.samsung.com (USCPEMTA) with SMTP id 35.50.10104.05E1AF16;
	Wed, 2 Feb 2022 01:01:52 -0500 (EST)
Received: from ussmgxs3new.samsung.com (u92.gpu85.samsung.co.kr
	[203.254.195.92]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20220202060152uscas1p223157b1d5017fe710820cefd35fac1bb~P4sIkumlW0693906939uscas1p25;
	Wed,  2 Feb 2022 06:01:52 +0000 (GMT)
X-AuditID: cbfec36f-2fdff70000002778-e1-61fa1e5068d0
Received: from SSI-EX4.ssi.samsung.com ( [105.128.2.145]) by
	ussmgxs3new.samsung.com (USCPEXMTA) with SMTP id 8C.F5.09657.05E1AF16;
	Wed, 2 Feb 2022 01:01:52 -0500 (EST)
Received: from SSI-EX3.ssi.samsung.com (105.128.2.228) by
	SSI-EX4.ssi.samsung.com (105.128.2.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.2242.4; Tue, 1 Feb 2022 22:01:14 -0800
Received: from SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36]) by
	SSI-EX3.ssi.samsung.com ([fe80::8d80:5816:c578:8c36%3]) with mapi id
	15.01.2242.008; Tue, 1 Feb 2022 22:01:13 -0800
From: Adam Manzanares <a.manzanares@samsung.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Thread-Topic: [RFC PATCH 3/3] nvme: add the "debug" host driver
Thread-Index: AQHYF5o0LMwUDmubDUu2kNRmd7lMHKyAS6yA
Date: Wed, 2 Feb 2022 06:01:13 +0000
Message-ID: <20220202060154.GA120951@bgt-140510-bm01>
In-Reply-To: <alpine.LRH.2.02.2202011333160.22481@file01.intranet.prod.int.rdu2.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
x-exchange-save: DSA
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxyAc+69vS0VyLUSOLQbum4scQ4GvnK2OaZxiXczcyTLXJQNqXpX
	G3mYljo0cYJEIgKTAipUYqFb6KA4WVnQ8SijiIBIaVcrWIdbB8ZNpTwES7GFUW5N+O87Od85
	+X4nh4cLjKSQJ0vPZOTpklQxySeabs6YYxKj5iRxPvNmpB8+R6ILEx4cjXeMcFDJuXIuso2G
	ojbXJQ6yzOZgaMSwgKFWbQmGavVdGHqk+wGg/D4LhrzOeFRiugtQm2Mdam3rJZCm5iEXFQxe
	J5HxSRuOdN3zGFKdsWPIrPaSqPOBnUB6L0KnCz1c9Lg9eauQtt3ZSatyXVw6t+pPgrb1K2lD
	XT5JN/54ki4d0gG65V42SZ+63YXT5VPTJD14+xpGF+W6SHryoYOgm5xFXHrcaCfpq7/aicRV
	e/lbDjKpsqOM/J2EFP6hdt84ODLnAFn9pTNENqgwgLMgiAepjdDbZ8P8LKBqAVzwCc4C/iKf
	xmBzpZX7UrqiLQGsdAVAc2ccK00AOPxPA5ddtAOY3/mA47dIKg6+6P4F93MYtRb+UfmU45dw
	yhcE9QXdi1fxeKuoBFjt+YR1PoRTndqAvx76pgqXkgjqDXjDWEX6OYTaBN2TeUtFQVQSfG41
	EX4GVDh036pf8nEqAjpGNRhbvRJqL7XiLIfD+WYnyfJr8C/3f4HJwuDP7jGSPRsLh86XBTgB
	Dve0A5bXwZrqJzjbsBL2VowS7NlI2PHTEOGfC1K/8aFe/X3g0o9g411P4H1F8GK9LSDVAVj2
	PI/LLhoBLJ+zYMUgWr2sXL2sRL2sRL2sRL2spApw6kCEUqFIkzKK9enMt7EKSZpCmS6NPZCR
	ZgCLX7xvvjPjOhh0TMaaAMYDJgB5uDgspK3aLRGEHJQcO87IM/bJlamMwgREPEIcEVIja5AI
	KKkkkznMMEcY+ctdjBckzMYkkWT311ZzvMEsbtIl/y0PnXtz+8aG0N1pqkdT0V+cUVWM/btm
	enCfTEPMpmTtKJWeanmWufPwZvBCvgucuKim3rcEGzARJcrXqHS9A1k53v7cvE8/KCoqVlNv
	61wbWoTWAwXvKjY8dcZ8rrkgRS29W+9kBJvEztn+bZdRQypzNfLa6pw941phxA17QqLK1jG+
	gxubEgVfffal3jUQXHy/TrRpv2WgNG7FZ9Hce/2v/O4WJTMnV285seL1Cd3RmYVw1DXyza2x
	vbnEdI+ONzxxbH+ZbNueean+vvj4V57wxzfP72a0a79LYgqjPt7eI2qKqUxq9infM1oE1jX1
	taNTYkJxSBL/Fi5XSP4H3T3wH1EEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBKsWRmVeSWpSXmKPExsWS2cA0UTdA7leiwfF7Yhar7/azWUz78JPZ
	4v3Bx6wWk/pnsFtcfsJnsffdbFaLCz8amSweb/rPZLFn0SQmi5WrjzJZPF++mNGi8/QFJos/
	Dw0tJh26xmix95a2xZ69J1ks5i97ym7RfX0Hm8W+13uZLZYf/8dkMbHjKpPFuVl/2CwO37vK
	YrH6j4VFa89PdotX++McpDwuX/H2mNj8jt2jecEdFo/LZ0s9Nq3qZPPYvKTeY/KN5Yweu282
	sHk0nTnK7DHj0xc2j+tntjN59Da/Y/P4+PQWi8e2h73sHu/3XWXzWL/lKkuAcBSXTUpqTmZZ
	apG+XQJXxv6/7xkLft1irDg7+StLA+PMTYxdjJwcEgImEmsXTQKyuTiEBFYzSvx9vZUVwvnA
	KNHbdgXK2c8oMWV9IytIC5uAgcTv4xuZQWwRAU2JS3PegBUxC/zllDjwoQXI4eAQFrCTWPjT
	C6LGXuLT4UVQ9UYSfz/1MIHYLAIqEkf2LWADsXkFTCW+f2xjh1j2iEnizffJLCAJToFoiW8X
	D4HZjAJiEt9PrQFrZhYQl7j1ZD4TxA8CEkv2nGeGsEUlXj7+xwphK0rc//6SHcIWkVj3/S0b
	RK+exI2pU6BsO4m7J/YzQtjaEssWvmaGOEhQ4uTMJywQvZISB1fcYJnAKDkLyepZSEbNQjJq
	FpJRs5CMWsDIuopRvLS4ODe9otg4L7Vcrzgxt7g0L10vOT93EyMwMZ7+dzhmB+O9Wx/1DjEy
	cTAeYpTgYFYS4d278HuiEG9KYmVValF+fFFpTmrxIUZpDhYlcV6P2InxQgLpiSWp2ampBalF
	MFkmDk6pBiaun4mpl2Uu7L3ZOWGj8+WT/x+U14j++JOx+eUN1VPJ4VaPL8goFPX9Yb5hv3V3
	YkUMz7ZJLzoET2g6v1L/XHb90+dVbu8ePKu4rsJnfaGfecOMbTs8/ePYIqfO1pW4bP04cK5d
	fuvSH3I/dj8zUf613rm5NmvvrWM5cUdm7O0z8t2cfFZSgeHQpuq7l7Zr/hD6VKnV/Kt4UlTW
	sxkFysvC+xubhW/e+KZiYMqg/yJ6v5R8ebSo3z/D4KhtPA9z0/dnMyt7+O8Na1D62n7h78mS
	tz1zj1l83G/2/f+/m/PXxl7bG/qnec+qEnOFtx8uaRjk1iYdfVXpbaiSEywf6LSlcOIdva7l
	lpN4lk3fwzFJiaU4I9FQi7moOBEAwc+yePsDAAA=
X-CMS-MailID: 20220202060152uscas1p223157b1d5017fe710820cefd35fac1bb
CMS-TYPE: 301P
X-CMS-RootMailID: 20220201183359uscas1p2d7e48dc4cafed3df60c304a06f2323cd
References: <f0e19ae4-b37a-e9a3-2be7-a5afb334a5c3@nvidia.com>
	<20220201102122.4okwj2gipjbvuyux@mpHalley-2>
	<alpine.LRH.2.02.2202011327350.22481@file01.intranet.prod.int.rdu2.redhat.com>
	<CGME20220201183359uscas1p2d7e48dc4cafed3df60c304a06f2323cd@uscas1p2.samsung.com>
	<alpine.LRH.2.02.2202011333160.22481@file01.intranet.prod.int.rdu2.redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 21261w3X019942
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 02 Feb 2022 01:18:44 -0500
Cc: "djwong@kernel.org" <djwong@kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"clm@fb.com" <clm@fb.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"osandov@fb.com" <osandov@fb.com>,
	=?iso-8859-1?Q?Javier_Gonz=E1lez?= <javier@javigon.com>, Bart
	Van Assche <bvanassche@acm.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>, Chaitanya
	Kulkarni <chaitanyak@nvidia.com>,
	"msnitzer@redhat.com >> msnitzer@redhat.com" <msnitzer@redhat.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dsterba@suse.com" <dsterba@suse.com>, "kbus
	@imap.gmail.com>> Keith Busch" <kbusch@kernel.org>,
	"Frederick.Knight@netapp.com" <Frederick.Knight@netapp.com>,
	Jens Axboe <axboe@kernel.dk>, "tytso@mit.edu" <tytso@mit.edu>,
	Kanchan Joshi <joshi.k@samsung.com>,
	"martin.petersen@oracle.com >> Martin K.
	Petersen" <martin.petersen@oracle.com>, "jack@suse.com" <jack@suse.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>
Subject: Re: [dm-devel] [RFC PATCH 3/3] nvme: add the "debug" host driver
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <1C941B6A1CEAD64DA35D9C50358485E3@ssi.samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 01, 2022 at 01:33:47PM -0500, Mikulas Patocka wrote:
> This patch adds a new driver "nvme-debug". It uses memory as a backing
> store and it is used to test the copy offload functionality.
>

We have looked at something similar to create a null nvme driver to test 
interfaces poking the nvme driver without using the block layer. Have you 
considered implementing this in the fabrics code since it is already virtualizng
a ssd controller? 

BTW I think having the target code be able to implement simple copy without 
moving data over the fabric would be a great way of showing off the command.


> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> ---
>  drivers/nvme/host/Kconfig      |   13 
>  drivers/nvme/host/Makefile     |    1 
>  drivers/nvme/host/nvme-debug.c |  838 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 852 insertions(+)
> 
> Index: linux-2.6/drivers/nvme/host/Kconfig
> ===================================================================
> --- linux-2.6.orig/drivers/nvme/host/Kconfig	2022-02-01 18:34:22.000000000 +0100
> +++ linux-2.6/drivers/nvme/host/Kconfig	2022-02-01 18:34:22.000000000 +0100
> @@ -83,3 +83,16 @@ config NVME_TCP
>  	  from https://urldefense.com/v3/__https://protect2.fireeye.com/v1/url?k=26ebb71c-79708e5a-26ea3c53-0cc47a3003e8-a628bd4c53dd84d1&q=1&e=9f16193b-4232-4453-9889-7cdf5d653922&u=https*3A*2F*2Fgithub.com*2Flinux-nvme*2Fnvme-cli__;JSUlJSU!!EwVzqGoTKBqv-0DWAJBm!HyJHAJgOq3M4SIOA0HvhX95q50ACkRtsiHWmAQERqjGLQ0pLb_Jru8QcwOQyix0tTVJA$ .
>  
>  	  If unsure, say N.
> +
> +config NVME_DEBUG
> +	tristate "NVM Express debug"
> +	depends on INET
> +	depends on BLOCK
> +	select NVME_CORE
> +	select NVME_FABRICS
> +	select CRYPTO
> +	select CRYPTO_CRC32C
> +	help
> +	  This pseudo driver simulates a NVMe adapter.
> +
> +	  If unsure, say N.
> Index: linux-2.6/drivers/nvme/host/Makefile
> ===================================================================
> --- linux-2.6.orig/drivers/nvme/host/Makefile	2022-02-01 18:34:22.000000000 +0100
> +++ linux-2.6/drivers/nvme/host/Makefile	2022-02-01 18:34:22.000000000 +0100
> @@ -8,6 +8,7 @@ obj-$(CONFIG_NVME_FABRICS)		+= nvme-fabr
>  obj-$(CONFIG_NVME_RDMA)			+= nvme-rdma.o
>  obj-$(CONFIG_NVME_FC)			+= nvme-fc.o
>  obj-$(CONFIG_NVME_TCP)			+= nvme-tcp.o
> +obj-$(CONFIG_NVME_DEBUG)		+= nvme-debug.o
>  
>  nvme-core-y				:= core.o ioctl.o
>  nvme-core-$(CONFIG_TRACING)		+= trace.o
> Index: linux-2.6/drivers/nvme/host/nvme-debug.c
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux-2.6/drivers/nvme/host/nvme-debug.c	2022-02-01 18:34:22.000000000 +0100
> @@ -0,0 +1,838 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * NVMe debug
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/blk-mq.h>
> +#include <linux/sort.h>
> +#include <linux/version.h>
> +
> +#include "nvme.h"
> +#include "fabrics.h"
> +
> +static ulong dev_size_mb = 16;
> +module_param_named(dev_size_mb, dev_size_mb, ulong, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(dev_size_mb, "size in MiB of the namespace(def=8)");
> +
> +static unsigned sector_size = 512;
> +module_param_named(sector_size, sector_size, uint, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(sector_size, "logical block size in bytes (def=512)");
> +
> +struct nvme_debug_ctrl {
> +	struct nvme_ctrl ctrl;
> +	uint32_t reg_cc;
> +	struct blk_mq_tag_set admin_tag_set;
> +	struct blk_mq_tag_set io_tag_set;
> +	struct workqueue_struct *admin_wq;
> +	struct workqueue_struct *io_wq;
> +	struct list_head namespaces;
> +	struct list_head list;
> +};
> +
> +struct nvme_debug_namespace {
> +	struct list_head list;
> +	uint32_t nsid;
> +	unsigned char sector_size_bits;
> +	size_t n_sectors;
> +	void *space;
> +	char uuid[16];
> +};
> +
> +struct nvme_debug_request {
> +	struct nvme_request req;
> +	struct nvme_command cmd;
> +	struct work_struct work;
> +};
> +
> +static LIST_HEAD(nvme_debug_ctrl_list);
> +static DEFINE_MUTEX(nvme_debug_ctrl_mutex);
> +
> +DEFINE_STATIC_PERCPU_RWSEM(nvme_debug_sem);
> +
> +static inline struct nvme_debug_ctrl *to_debug_ctrl(struct nvme_ctrl *nctrl)
> +{
> +	return container_of(nctrl, struct nvme_debug_ctrl, ctrl);
> +}
> +
> +static struct nvme_debug_namespace *nvme_debug_find_namespace(struct nvme_debug_ctrl *ctrl, unsigned nsid)
> +{
> +	struct nvme_debug_namespace *ns;
> +	list_for_each_entry(ns, &ctrl->namespaces, list) {
> +		if (ns->nsid == nsid)
> +			return ns;
> +	}
> +	return NULL;
> +}
> +
> +static bool nvme_debug_alloc_namespace(struct nvme_debug_ctrl *ctrl)
> +{
> +	struct nvme_debug_namespace *ns;
> +	unsigned s;
> +	size_t dsm;
> +
> +	ns = kmalloc(sizeof(struct nvme_debug_namespace), GFP_KERNEL);
> +	if (!ns)
> +		goto fail0;
> +
> +	ns->nsid = 1;
> +	while (nvme_debug_find_namespace(ctrl, ns->nsid))
> +		ns->nsid++;
> +
> +	s = READ_ONCE(sector_size);
> +	if (s < 512 || s > PAGE_SIZE || !is_power_of_2(s))
> +		goto fail1;
> +	ns->sector_size_bits = __ffs(s);
> +	dsm = READ_ONCE(dev_size_mb);
> +	ns->n_sectors = dsm << (20 - ns->sector_size_bits);
> +	if (ns->n_sectors >> (20 - ns->sector_size_bits) != dsm)
> +		goto fail1;
> +
> +	if (ns->n_sectors << ns->sector_size_bits >> ns->sector_size_bits != ns->n_sectors)
> +		goto fail1;
> +
> +	ns->space = vzalloc(ns->n_sectors << ns->sector_size_bits);
> +	if (!ns->space)
> +		goto fail1;
> +
> +	generate_random_uuid(ns->uuid);
> +
> +	list_add(&ns->list, &ctrl->namespaces);
> +	return true;
> +
> +fail1:
> +	kfree(ns);
> +fail0:
> +	return false;
> +}
> +
> +static void nvme_debug_free_namespace(struct nvme_debug_namespace *ns)
> +{
> +	vfree(ns->space);
> +	list_del(&ns->list);
> +	kfree(ns);
> +}
> +
> +static int nvme_debug_reg_read32(struct nvme_ctrl *nctrl, u32 off, u32 *val)
> +{
> +	struct nvme_debug_ctrl *ctrl = to_debug_ctrl(nctrl);
> +	switch (off) {
> +		case NVME_REG_VS: {
> +			*val = 0x20000;
> +			break;
> +		}
> +		case NVME_REG_CC: {
> +			*val = ctrl->reg_cc;
> +			break;
> +		}
> +		case NVME_REG_CSTS: {
> +			*val = 0;
> +			if (ctrl->reg_cc & NVME_CC_ENABLE)
> +				*val |= NVME_CSTS_RDY;
> +			if (ctrl->reg_cc & NVME_CC_SHN_MASK)
> +				*val |= NVME_CSTS_SHST_CMPLT;
> +			break;
> +		}
> +		default: {
> +			printk("nvme_debug_reg_read32: %x\n", off);
> +			return -ENOSYS;
> +		}
> +	}
> +	return 0;
> +}
> +
> +int nvme_debug_reg_read64(struct nvme_ctrl *nctrl, u32 off, u64 *val)
> +{
> +	switch (off) {
> +		case NVME_REG_CAP: {
> +			*val = (1ULL << 0) | (1ULL << 37);
> +			break;
> +		}
> +		default: {
> +			printk("nvme_debug_reg_read64: %x\n", off);
> +			return -ENOSYS;
> +		}
> +	}
> +	return 0;
> +}
> +
> +int nvme_debug_reg_write32(struct nvme_ctrl *nctrl, u32 off, u32 val)
> +{
> +	struct nvme_debug_ctrl *ctrl = to_debug_ctrl(nctrl);
> +	switch (off) {
> +		case NVME_REG_CC: {
> +			ctrl->reg_cc = val;
> +			break;
> +		}
> +		default: {
> +			printk("nvme_debug_reg_write32: %x, %x\n", off, val);
> +			return -ENOSYS;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static void nvme_debug_submit_async_event(struct nvme_ctrl *nctrl)
> +{
> +	printk("nvme_debug_submit_async_event\n");
> +}
> +
> +static void nvme_debug_delete_ctrl(struct nvme_ctrl *nctrl)
> +{
> +	nvme_shutdown_ctrl(nctrl);
> +}
> +
> +static void nvme_debug_free_namespaces(struct nvme_debug_ctrl *ctrl)
> +{
> +	if (!list_empty(&ctrl->namespaces)) {
> +		struct nvme_debug_namespace *ns = container_of(ctrl->namespaces.next, struct nvme_debug_namespace, list);
> +		nvme_debug_free_namespace(ns);
> +	}
> +}
> +
> +static void nvme_debug_free_ctrl(struct nvme_ctrl *nctrl)
> +{
> +	struct nvme_debug_ctrl *ctrl = to_debug_ctrl(nctrl);
> +
> +	flush_workqueue(ctrl->admin_wq);
> +	flush_workqueue(ctrl->io_wq);
> +
> +	nvme_debug_free_namespaces(ctrl);
> +
> +	if (list_empty(&ctrl->list))
> +		goto free_ctrl;
> +
> +	mutex_lock(&nvme_debug_ctrl_mutex);
> +	list_del(&ctrl->list);
> +	mutex_unlock(&nvme_debug_ctrl_mutex);
> +
> +	nvmf_free_options(nctrl->opts);
> +free_ctrl:
> +	destroy_workqueue(ctrl->admin_wq);
> +	destroy_workqueue(ctrl->io_wq);
> +	kfree(ctrl);
> +}
> +
> +static int nvme_debug_get_address(struct nvme_ctrl *nctrl, char *buf, int size)
> +{
> +	int len = 0;
> +	len += snprintf(buf, size, "debug");
> +	return len;
> +}
> +
> +static void nvme_debug_reset_ctrl_work(struct work_struct *work)
> +{
> +	printk("nvme_reset_ctrl_work\n");
> +}
> +
> +static void copy_data_request(struct request *req, void *data, size_t size, bool to_req)
> +{
> +	if (req->rq_flags & RQF_SPECIAL_PAYLOAD) {
> +		void *addr;
> +		struct bio_vec bv = req->special_vec;
> +		addr = kmap_atomic(bv.bv_page);
> +		if (to_req) {
> +			memcpy(addr + bv.bv_offset, data, bv.bv_len);
> +			flush_dcache_page(bv.bv_page);
> +		} else {
> +			flush_dcache_page(bv.bv_page);
> +			memcpy(data, addr + bv.bv_offset, bv.bv_len);
> +		}
> +		kunmap_atomic(addr);
> +		data += bv.bv_len;
> +		size -= bv.bv_len;
> +	} else {
> +		struct req_iterator bi;
> +		struct bio_vec bv;
> +		rq_for_each_segment(bv, req, bi) {
> +			void *addr;
> +			addr = kmap_atomic(bv.bv_page);
> +			if (to_req) {
> +				memcpy(addr + bv.bv_offset, data, bv.bv_len);
> +				flush_dcache_page(bv.bv_page);
> +			} else {
> +				flush_dcache_page(bv.bv_page);
> +				memcpy(data, addr + bv.bv_offset, bv.bv_len);
> +			}
> +			kunmap_atomic(addr);
> +			data += bv.bv_len;
> +			size -= bv.bv_len;
> +		}
> +	}
> +	if (size)
> +		printk("size mismatch: %lx\n", (unsigned long)size);
> +}
> +
> +static void nvme_debug_identify_ns(struct nvme_debug_ctrl *ctrl, struct request *req)
> +{
> +	struct nvme_id_ns *id;
> +	struct nvme_debug_namespace *ns;
> +	struct nvme_debug_request *ndr = blk_mq_rq_to_pdu(req);
> +
> +	id = kzalloc(sizeof(struct nvme_id_ns), GFP_NOIO);
> +	if (!id) {
> +		blk_mq_end_request(req, BLK_STS_RESOURCE);
> +		return;
> +	}
> +
> +	ns = nvme_debug_find_namespace(ctrl, le32_to_cpu(ndr->cmd.identify.nsid));
> +	if (!ns) {
> +		nvme_req(req)->status = cpu_to_le16(NVME_SC_INVALID_NS);
> +		goto free_ret;
> +	}
> +
> +	id->nsze = cpu_to_le64(ns->n_sectors);
> +	id->ncap = id->nsze;
> +	id->nuse = id->nsze;
> +	/*id->nlbaf = 0;*/
> +	id->dlfeat = 0x01;
> +	id->lbaf[0].ds = ns->sector_size_bits;
> +
> +	copy_data_request(req, id, sizeof(struct nvme_id_ns), true);
> +
> +free_ret:
> +	kfree(id);
> +	blk_mq_end_request(req, BLK_STS_OK);
> +}
> +
> +static void nvme_debug_identify_ctrl(struct nvme_debug_ctrl *ctrl, struct request *req)
> +{
> +	struct nvme_debug_namespace *ns;
> +	struct nvme_id_ctrl *id;
> +	char ver[9];
> +	size_t ver_len;
> +
> +	id = kzalloc(sizeof(struct nvme_id_ctrl), GFP_NOIO);
> +	if (!id) {
> +		blk_mq_end_request(req, BLK_STS_RESOURCE);
> +		return;
> +	}
> +
> +	id->vid = cpu_to_le16(PCI_VENDOR_ID_REDHAT);
> +	id->ssvid = cpu_to_le16(PCI_VENDOR_ID_REDHAT);
> +	memset(id->sn, ' ', sizeof id->sn);
> +	memset(id->mn, ' ', sizeof id->mn);
> +	memcpy(id->mn, "nvme-debug", 10);
> +	snprintf(ver, sizeof ver, "%X", LINUX_VERSION_CODE);
> +	ver_len = min(strlen(ver), sizeof id->fr);
> +	memset(id->fr, ' ', sizeof id->fr);
> +	memcpy(id->fr, ver, ver_len);
> +	memcpy(id->ieee, "\xe9\xf2\x40", sizeof id->ieee);
> +	id->ver = cpu_to_le32(0x20000);
> +	id->kas = cpu_to_le16(100);
> +	id->sqes = 0x66;
> +	id->cqes = 0x44;
> +	id->maxcmd = cpu_to_le16(1);
> +	mutex_lock(&nvme_debug_ctrl_mutex);
> +	list_for_each_entry(ns, &ctrl->namespaces, list) {
> +		if (ns->nsid > le32_to_cpu(id->nn))
> +			id->nn = cpu_to_le32(ns->nsid);
> +	}
> +	mutex_unlock(&nvme_debug_ctrl_mutex);
> +	id->oncs = cpu_to_le16(NVME_CTRL_ONCS_COPY);
> +	id->vwc = 0x6;
> +	id->mnan = cpu_to_le32(0xffffffff);
> +	strcpy(id->subnqn, "nqn.2021-09.com.redhat:nvme-debug");
> +	id->ioccsz = cpu_to_le32(4);
> +	id->iorcsz = cpu_to_le32(1);
> +
> +	copy_data_request(req, id, sizeof(struct nvme_id_ctrl), true);
> +
> +	kfree(id);
> +	blk_mq_end_request(req, BLK_STS_OK);
> +}
> +
> +static int cmp_ns(const void *a1, const void *a2)
> +{
> +	__u32 v1 = le32_to_cpu(*(__u32 *)a1);
> +	__u32 v2 = le32_to_cpu(*(__u32 *)a2);
> +	if (!v1)
> +		v1 = 0xffffffffU;
> +	if (!v2)
> +		v2 = 0xffffffffU;
> +	if (v1 < v2)
> +		return -1;
> +	if (v1 > v2)
> +		return 1;
> +	return 0;
> +}
> +
> +static void nvme_debug_identify_active_ns(struct nvme_debug_ctrl *ctrl, struct request *req)
> +{
> +	struct nvme_debug_namespace *ns;
> +	struct nvme_debug_request *ndr = blk_mq_rq_to_pdu(req);
> +	unsigned size;
> +	__u32 *id;
> +	unsigned idp;
> +
> +	if (le32_to_cpu(ndr->cmd.identify.nsid) >= 0xFFFFFFFE) {
> +		nvme_req(req)->status = cpu_to_le16(NVME_SC_INVALID_NS);
> +		blk_mq_end_request(req, BLK_STS_OK);
> +		return;
> +	}
> +
> +	mutex_lock(&nvme_debug_ctrl_mutex);
> +	size = 0;
> +	list_for_each_entry(ns, &ctrl->namespaces, list) {
> +		size++;
> +	}
> +	size = min(size, 1024U);
> +
> +	id = kzalloc(sizeof(__u32) * size, GFP_NOIO);
> +	if (!id) {
> +		mutex_unlock(&nvme_debug_ctrl_mutex);
> +		blk_mq_end_request(req, BLK_STS_RESOURCE);
> +		return;
> +	}
> +
> +	idp = 0;
> +	list_for_each_entry(ns, &ctrl->namespaces, list) {
> +		if (ns->nsid > le32_to_cpu(ndr->cmd.identify.nsid))
> +			id[idp++] = cpu_to_le32(ns->nsid);
> +	}
> +	mutex_unlock(&nvme_debug_ctrl_mutex);
> +	sort(id, idp, sizeof(__u32), cmp_ns, NULL);
> +
> +	copy_data_request(req, id, sizeof(__u32) * 1024, true);
> +
> +	kfree(id);
> +	blk_mq_end_request(req, BLK_STS_OK);
> +}
> +
> +static void nvme_debug_identify_ns_desc_list(struct nvme_debug_ctrl *ctrl, struct request *req)
> +{
> +	struct nvme_ns_id_desc *id;
> +	struct nvme_debug_namespace *ns;
> +	struct nvme_debug_request *ndr = blk_mq_rq_to_pdu(req);
> +	id = kzalloc(4096, GFP_NOIO);
> +	if (!id) {
> +		blk_mq_end_request(req, BLK_STS_RESOURCE);
> +		return;
> +	}
> +
> +	ns = nvme_debug_find_namespace(ctrl, le32_to_cpu(ndr->cmd.identify.nsid));
> +	if (!ns) {
> +		nvme_req(req)->status = cpu_to_le16(NVME_SC_INVALID_NS);
> +		goto free_ret;
> +	}
> +
> +	id->nidt = NVME_NIDT_UUID;
> +	id->nidl = NVME_NIDT_UUID_LEN;
> +	memcpy((char *)(id + 1), ns->uuid, NVME_NIDT_UUID_LEN);
> +
> +	copy_data_request(req, id, 4096, true);
> +
> +free_ret:
> +	kfree(id);
> +	blk_mq_end_request(req, BLK_STS_OK);
> +}
> +
> +static void nvme_debug_identify_ctrl_cs(struct request *req)
> +{
> +	struct nvme_id_ctrl_nvm *id;
> +	id = kzalloc(sizeof(struct nvme_id_ctrl_nvm), GFP_NOIO);
> +	if (!id) {
> +		blk_mq_end_request(req, BLK_STS_RESOURCE);
> +		return;
> +	}
> +
> +	copy_data_request(req, id, sizeof(struct nvme_id_ctrl_nvm), true);
> +
> +	kfree(id);
> +	blk_mq_end_request(req, BLK_STS_OK);
> +}
> +
> +static void nvme_debug_admin_rq(struct work_struct *w)
> +{
> +	struct nvme_debug_request *ndr = container_of(w, struct nvme_debug_request, work);
> +	struct request *req = (struct request *)ndr - 1;
> +	struct nvme_debug_ctrl *ctrl = to_debug_ctrl(ndr->req.ctrl);
> +
> +	switch (ndr->cmd.common.opcode) {
> +		case nvme_admin_identify: {
> +			switch (ndr->cmd.identify.cns) {
> +				case NVME_ID_CNS_NS: {
> +					percpu_down_read(&nvme_debug_sem);
> +					nvme_debug_identify_ns(ctrl, req);
> +					percpu_up_read(&nvme_debug_sem);
> +					return;
> +				};
> +				case NVME_ID_CNS_CTRL: {
> +					percpu_down_read(&nvme_debug_sem);
> +					nvme_debug_identify_ctrl(ctrl, req);
> +					percpu_up_read(&nvme_debug_sem);
> +					return;
> +				}
> +				case NVME_ID_CNS_NS_ACTIVE_LIST: {
> +					percpu_down_read(&nvme_debug_sem);
> +					nvme_debug_identify_active_ns(ctrl, req);
> +					percpu_up_read(&nvme_debug_sem);
> +					return;
> +				}
> +				case NVME_ID_CNS_NS_DESC_LIST: {
> +					percpu_down_read(&nvme_debug_sem);
> +					nvme_debug_identify_ns_desc_list(ctrl, req);
> +					percpu_up_read(&nvme_debug_sem);
> +					return;
> +				}
> +				case NVME_ID_CNS_CS_CTRL: {
> +					percpu_down_read(&nvme_debug_sem);
> +					nvme_debug_identify_ctrl_cs(req);
> +					percpu_up_read(&nvme_debug_sem);
> +					return;
> +				}
> +				default: {
> +					printk("nvme_admin_identify: %x\n", ndr->cmd.identify.cns);
> +					break;
> +				}
> +			}
> +			break;
> +		}
> +		default: {
> +			printk("nvme_debug_admin_rq: %x\n", ndr->cmd.common.opcode);
> +			break;
> +		}
> +	}
> +	blk_mq_end_request(req, BLK_STS_NOTSUPP);
> +}
> +
> +static void nvme_debug_rw(struct nvme_debug_namespace *ns, struct request *req)
> +{
> +	struct nvme_debug_request *ndr = blk_mq_rq_to_pdu(req);
> +	__u64 lba = cpu_to_le64(ndr->cmd.rw.slba);
> +	__u64 len = (__u64)cpu_to_le16(ndr->cmd.rw.length) + 1;
> +	void *addr;
> +	if (unlikely(lba + len < lba) || unlikely(lba + len > ns->n_sectors)) {
> +		blk_mq_end_request(req, BLK_STS_NOTSUPP);
> +		return;
> +	}
> +	addr = ns->space + (lba << ns->sector_size_bits);
> +	copy_data_request(req, addr, len << ns->sector_size_bits, ndr->cmd.rw.opcode == nvme_cmd_read);
> +	blk_mq_end_request(req, BLK_STS_OK);
> +}
> +
> +static void nvme_debug_copy(struct nvme_debug_namespace *ns, struct request *req)
> +{
> +	struct nvme_debug_request *ndr = blk_mq_rq_to_pdu(req);
> +	__u64 dlba = cpu_to_le64(ndr->cmd.copy.sdlba);
> +	unsigned n_descs = ndr->cmd.copy.length + 1;
> +	struct nvme_copy_desc *descs;
> +	unsigned i, ret;
> +
> +	descs = kmalloc(sizeof(struct nvme_copy_desc) * n_descs, GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
> +	if (!descs) {
> +		blk_mq_end_request(req, BLK_STS_RESOURCE);
> +		return;
> +	}
> +
> +	copy_data_request(req, descs, sizeof(struct nvme_copy_desc) * n_descs, false);
> +
> +	for (i = 0; i < n_descs; i++) {
> +		struct nvme_copy_desc *desc = &descs[i];
> +		__u64 slba = cpu_to_le64(desc->slba);
> +		__u64 len = (__u64)cpu_to_le16(desc->length) + 1;
> +		void *saddr, *daddr;
> +
> +		if (unlikely(slba + len < slba) || unlikely(slba + len > ns->n_sectors) ||
> +		    unlikely(dlba + len < dlba) || unlikely(dlba + len > ns->n_sectors)) {
> +			ret = BLK_STS_NOTSUPP;
> +			goto free_ret;
> +		}
> +
> +		saddr = ns->space + (slba << ns->sector_size_bits);
> +		daddr = ns->space + (dlba << ns->sector_size_bits);
> +
> +		memcpy(daddr, saddr, len << ns->sector_size_bits);
> +
> +		dlba += len;
> +	}
> +
> +	ret = BLK_STS_OK;
> +
> +free_ret:
> +	kfree(descs);
> +
> +	blk_mq_end_request(req, ret);
> +}
> +
> +static void nvme_debug_io_rq(struct work_struct *w)
> +{
> +	struct nvme_debug_request *ndr = container_of(w, struct nvme_debug_request, work);
> +	struct request *req = (struct request *)ndr - 1;
> +	struct nvme_debug_ctrl *ctrl = to_debug_ctrl(ndr->req.ctrl);
> +	__u32 nsid = le32_to_cpu(ndr->cmd.common.nsid);
> +	struct nvme_debug_namespace *ns;
> +
> +	percpu_down_read(&nvme_debug_sem);
> +	ns = nvme_debug_find_namespace(ctrl, nsid);
> +	if (unlikely(!ns))
> +		goto ret_notsupp;
> +
> +	switch (ndr->cmd.common.opcode) {
> +		case nvme_cmd_flush: {
> +			blk_mq_end_request(req, BLK_STS_OK);
> +			goto ret;
> +		}
> +		case nvme_cmd_read:
> +		case nvme_cmd_write: {
> +			nvme_debug_rw(ns, req);
> +			goto ret;
> +		}
> +		case nvme_cmd_copy: {
> +			nvme_debug_copy(ns, req);
> +			goto ret;
> +		}
> +		default: {
> +			printk("nvme_debug_io_rq: %x\n", ndr->cmd.common.opcode);
> +			break;
> +		}
> +	}
> +ret_notsupp:
> +	blk_mq_end_request(req, BLK_STS_NOTSUPP);
> +ret:
> +	percpu_up_read(&nvme_debug_sem);
> +}
> +
> +static blk_status_t nvme_debug_queue_rq(struct blk_mq_hw_ctx *hctx, const struct blk_mq_queue_data *bd)
> +{
> +	struct request *req = bd->rq;
> +	struct nvme_debug_request *ndr = blk_mq_rq_to_pdu(req);
> +	struct nvme_debug_ctrl *ctrl = to_debug_ctrl(ndr->req.ctrl);
> +	struct nvme_ns *ns = hctx->queue->queuedata;
> +	blk_status_t r;
> +
> +	r = nvme_setup_cmd(ns, req);
> +	if (unlikely(r))
> +		return r;
> +
> +	if (!ns) {
> +		INIT_WORK(&ndr->work, nvme_debug_admin_rq);
> +		queue_work(ctrl->admin_wq, &ndr->work);
> +		return BLK_STS_OK;
> +	} else if (unlikely((req->cmd_flags & REQ_OP_MASK) == REQ_OP_COPY_READ_TOKEN)) {
> +		blk_mq_end_request(req, BLK_STS_OK);
> +		return BLK_STS_OK;
> +	} else {
> +		INIT_WORK(&ndr->work, nvme_debug_io_rq);
> +		queue_work(ctrl->io_wq, &ndr->work);
> +		return BLK_STS_OK;
> +	}
> +}
> +
> +static int nvme_debug_init_request(struct blk_mq_tag_set *set, struct request *req, unsigned hctx_idx, unsigned numa_node)
> +{
> +	struct nvme_debug_ctrl *ctrl = set->driver_data;
> +	struct nvme_debug_request *ndr = blk_mq_rq_to_pdu(req);
> +	nvme_req(req)->ctrl = &ctrl->ctrl;
> +	nvme_req(req)->cmd = &ndr->cmd;
> +	return 0;
> +}
> +
> +static int nvme_debug_init_hctx(struct blk_mq_hw_ctx *hctx, void *data, unsigned hctx_idx)
> +{
> +	struct nvme_debug_ctrl *ctrl = data;
> +	hctx->driver_data = ctrl;
> +	return 0;
> +}
> +
> +static const struct blk_mq_ops nvme_debug_mq_ops = {
> +	.queue_rq = nvme_debug_queue_rq,
> +	.init_request = nvme_debug_init_request,
> +	.init_hctx = nvme_debug_init_hctx,
> +};
> +
> +static int nvme_debug_configure_admin_queue(struct nvme_debug_ctrl *ctrl)
> +{
> +	int r;
> +
> +	memset(&ctrl->admin_tag_set, 0, sizeof(ctrl->admin_tag_set));
> +	ctrl->admin_tag_set.ops = &nvme_debug_mq_ops;
> +	ctrl->admin_tag_set.queue_depth = NVME_AQ_MQ_TAG_DEPTH;
> +	ctrl->admin_tag_set.reserved_tags = NVMF_RESERVED_TAGS;
> +	ctrl->admin_tag_set.numa_node = ctrl->ctrl.numa_node;
> +	ctrl->admin_tag_set.cmd_size = sizeof(struct nvme_debug_request);
> +	ctrl->admin_tag_set.driver_data = ctrl;
> +	ctrl->admin_tag_set.nr_hw_queues = 1;
> +	ctrl->admin_tag_set.timeout = NVME_ADMIN_TIMEOUT;
> +	ctrl->admin_tag_set.flags = BLK_MQ_F_NO_SCHED;
> +
> +	r = blk_mq_alloc_tag_set(&ctrl->admin_tag_set);
> +	if (r)
> +		goto ret0;
> +	ctrl->ctrl.admin_tagset = &ctrl->admin_tag_set;
> +
> +	ctrl->ctrl.admin_q = blk_mq_init_queue(&ctrl->admin_tag_set);
> +	if (IS_ERR(ctrl->ctrl.admin_q)) {
> +		r = PTR_ERR(ctrl->ctrl.admin_q);
> +		goto ret1;
> +	}
> +
> +	r = nvme_enable_ctrl(&ctrl->ctrl);
> +	if (r)
> +		goto ret2;
> +
> +	nvme_start_admin_queue(&ctrl->ctrl);
> +
> +	r = nvme_init_ctrl_finish(&ctrl->ctrl);
> +	if (r)
> +		goto ret3;
> +
> +	return 0;
> +
> +ret3:
> +	nvme_stop_admin_queue(&ctrl->ctrl);
> +	blk_sync_queue(ctrl->ctrl.admin_q);
> +ret2:
> +	blk_cleanup_queue(ctrl->ctrl.admin_q);
> +ret1:
> +	blk_mq_free_tag_set(&ctrl->admin_tag_set);
> +ret0:
> +	return r;
> +}
> +
> +static int nvme_debug_configure_io_queue(struct nvme_debug_ctrl *ctrl)
> +{
> +	int r;
> +
> +	memset(&ctrl->io_tag_set, 0, sizeof(ctrl->io_tag_set));
> +	ctrl->io_tag_set.ops = &nvme_debug_mq_ops;
> +	ctrl->io_tag_set.queue_depth = NVME_AQ_MQ_TAG_DEPTH;
> +	ctrl->io_tag_set.reserved_tags = NVMF_RESERVED_TAGS;
> +	ctrl->io_tag_set.numa_node = ctrl->ctrl.numa_node;
> +	ctrl->io_tag_set.cmd_size = sizeof(struct nvme_debug_request);
> +	ctrl->io_tag_set.driver_data = ctrl;
> +	ctrl->io_tag_set.nr_hw_queues = 1;
> +	ctrl->io_tag_set.timeout = NVME_ADMIN_TIMEOUT;
> +	ctrl->io_tag_set.flags = BLK_MQ_F_NO_SCHED;
> +
> +	r = blk_mq_alloc_tag_set(&ctrl->io_tag_set);
> +	if (r)
> +		goto ret0;
> +	ctrl->ctrl.tagset = &ctrl->io_tag_set;
> +	return 0;
> +
> +ret0:
> +	return r;
> +}
> +
> +static const struct nvme_ctrl_ops nvme_debug_ctrl_ops = {
> +	.name = "debug",
> +	.module = THIS_MODULE,
> +	.flags = NVME_F_FABRICS,
> +	.reg_read32 = nvme_debug_reg_read32,
> +	.reg_read64 = nvme_debug_reg_read64,
> +	.reg_write32 = nvme_debug_reg_write32,
> +	.free_ctrl = nvme_debug_free_ctrl,
> +	.submit_async_event = nvme_debug_submit_async_event,
> +	.delete_ctrl = nvme_debug_delete_ctrl,
> +	.get_address = nvme_debug_get_address,
> +};
> +
> +static struct nvme_ctrl *nvme_debug_create_ctrl(struct device *dev,
> +		struct nvmf_ctrl_options *opts)
> +{
> +	int r;
> +	struct nvme_debug_ctrl *ctrl;
> +
> +	ctrl = kzalloc(sizeof(struct nvme_debug_ctrl), GFP_KERNEL);
> +	if (!ctrl) {
> +		r = -ENOMEM;
> +		goto ret0;
> +	}
> +
> +	INIT_LIST_HEAD(&ctrl->list);
> +	INIT_LIST_HEAD(&ctrl->namespaces);
> +	ctrl->ctrl.opts = opts;
> +	ctrl->ctrl.queue_count = 2;
> +	INIT_WORK(&ctrl->ctrl.reset_work, nvme_debug_reset_ctrl_work);
> +
> +	ctrl->admin_wq = alloc_workqueue("nvme-debug-admin", WQ_MEM_RECLAIM | WQ_UNBOUND, 1);
> +	if (!ctrl->admin_wq)
> +		goto ret1;
> +
> +	ctrl->io_wq = alloc_workqueue("nvme-debug-io", WQ_MEM_RECLAIM, 0);
> +	if (!ctrl->io_wq)
> +		goto ret1;
> +
> +	if (!nvme_debug_alloc_namespace(ctrl)) {
> +		r = -ENOMEM;
> +		goto ret1;
> +	}
> +
> +	r = nvme_init_ctrl(&ctrl->ctrl, dev, &nvme_debug_ctrl_ops, 0);
> +	if (r)
> +		goto ret1;
> +
> +        if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))
> +		goto ret2;
> +
> +	r = nvme_debug_configure_admin_queue(ctrl);
> +	if (r)
> +		goto ret2;
> +
> +	r = nvme_debug_configure_io_queue(ctrl);
> +	if (r)
> +		goto ret2;
> +
> +        if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_LIVE))
> +		goto ret2;
> +
> +	nvme_start_ctrl(&ctrl->ctrl);
> +
> +	mutex_lock(&nvme_debug_ctrl_mutex);
> +	list_add_tail(&ctrl->list, &nvme_debug_ctrl_list);
> +	mutex_unlock(&nvme_debug_ctrl_mutex);
> +
> +	return &ctrl->ctrl;
> +
> +ret2:
> +	nvme_uninit_ctrl(&ctrl->ctrl);
> +	nvme_put_ctrl(&ctrl->ctrl);
> +	return ERR_PTR(r);
> +ret1:
> +	nvme_debug_free_namespaces(ctrl);
> +	if (ctrl->admin_wq)
> +		destroy_workqueue(ctrl->admin_wq);
> +	if (ctrl->io_wq)
> +		destroy_workqueue(ctrl->io_wq);
> +	kfree(ctrl);
> +ret0:
> +	return ERR_PTR(r);
> +}
> +
> +static struct nvmf_transport_ops nvme_debug_transport = {
> +	.name		= "debug",
> +	.module		= THIS_MODULE,
> +	.required_opts	= NVMF_OPT_TRADDR,
> +	.allowed_opts	= NVMF_OPT_CTRL_LOSS_TMO,
> +	.create_ctrl	= nvme_debug_create_ctrl,
> +};
> +
> +static int __init nvme_debug_init_module(void)
> +{
> +	nvmf_register_transport(&nvme_debug_transport);
> +	return 0;
> +}
> +
> +static void __exit nvme_debug_cleanup_module(void)
> +{
> +	struct nvme_debug_ctrl *ctrl;
> +
> +	nvmf_unregister_transport(&nvme_debug_transport);
> +
> +	mutex_lock(&nvme_debug_ctrl_mutex);
> +	list_for_each_entry(ctrl, &nvme_debug_ctrl_list, list) {
> +		nvme_delete_ctrl(&ctrl->ctrl);
> +	}
> +	mutex_unlock(&nvme_debug_ctrl_mutex);
> +	flush_workqueue(nvme_delete_wq);
> +}
> +
> +module_init(nvme_debug_init_module);
> +module_exit(nvme_debug_cleanup_module);
> +
> +MODULE_LICENSE("GPL v2");
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


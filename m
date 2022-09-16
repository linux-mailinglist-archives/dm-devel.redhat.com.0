Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F235BACD4
	for <lists+dm-devel@lfdr.de>; Fri, 16 Sep 2022 13:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663329419;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jKE6fRfPM8IEVDUJK5b/5g7/2o/EJE2c9z9KzgTFiKY=;
	b=COXiwu0vYSUA8vGqmZmie+SzLDAlVm+mgX8dtOZME+g7vhDHFGFefBlQ+gabQ542klkxCE
	rD0uUQq4hnxWvBoMhNr66gX5Uo0PM/5PYWqqFmRxcFSAjMd/O0JGgdTxTDxUotNLDIq/SY
	Nnyc+kBjoiPqvQ9ZOGqb0oPPRbpbclU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-LrbKT1UoP4GPwa3TV4YD3A-1; Fri, 16 Sep 2022 07:56:58 -0400
X-MC-Unique: LrbKT1UoP4GPwa3TV4YD3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B09B381079D;
	Fri, 16 Sep 2022 11:56:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1A2E1121314;
	Fri, 16 Sep 2022 11:56:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D84419465A3;
	Fri, 16 Sep 2022 11:56:47 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E9351946586
 for <dm-devel@listman.corp.redhat.com>; Fri, 16 Sep 2022 11:56:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EEB33140EBF5; Fri, 16 Sep 2022 11:56:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB0B4140EBF3
 for <dm-devel@redhat.com>; Fri, 16 Sep 2022 11:56:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3F762A5955C
 for <dm-devel@redhat.com>; Fri, 16 Sep 2022 11:56:44 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-hCXVgd-oNbakNUr9otb_NQ-1; Fri, 16 Sep 2022 07:56:43 -0400
X-MC-Unique: hCXVgd-oNbakNUr9otb_NQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 u6-20020a05620a430600b006ce769b7150so8925962qko.0
 for <dm-devel@redhat.com>; Fri, 16 Sep 2022 04:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=chTOa9nfsN85Mo0aKyNtpBSHWBBmRSbzW50vElTD5ws=;
 b=MutRuTsUexqJIFK3kfHo42XKNsEy8d2t1xx8MKlTUkfhKQ4YhhxSr6a1a35DCOME+i
 3wcUeGcZgwbdrvZdFdKTf7zzOjaGSWjxQgG12PC+6HWAoLieRe9qpXjwqn/yvx+9IVOt
 abQHdQl9+TNWFDC9E/gMizGtSThByxcAvQrXadteW+JZ6XkkMP8btzXHQaE3LvBPZOF3
 ZSca5vXywCvh5abQNAf/61WpYpHXNpfiMA/XYbmqSI3t/mgRU2id4mEVqMHXSXLMtmEX
 Rd+M1gHN5cJ+3fuMHwfRPCTwEsFuKdn/cbgDC+AGFL0+MKj0RXT0v2Ewf0BZe6NTkDjp
 V+ag==
X-Gm-Message-State: ACrzQf3yMLMkPqBGhGLCQcROjawFnzzdhBzJzzocf6BQ8KxZvFq831MX
 q95UOrxBLJAufINQeieFRscpOqyGBt+RMGQI0aURS7A36QoUztyIeC1GygcvWK6U8CER1LG9bUL
 Pej+XNWl28qw94C0=
X-Received: by 2002:a05:622a:1a96:b0:35b:b868:fb1 with SMTP id
 s22-20020a05622a1a9600b0035bb8680fb1mr3907077qtc.116.1663329403268; 
 Fri, 16 Sep 2022 04:56:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM61rQguxip3VopENuW5BChfGUPbrsDyfGFwkeqvgW8D2mtv8HxW9f+7RmfWCZydcsFZ19h22g==
X-Received: by 2002:a05:622a:1a96:b0:35b:b868:fb1 with SMTP id
 s22-20020a05622a1a9600b0035bb8680fb1mr3907066qtc.116.1663329403013; 
 Fri, 16 Sep 2022 04:56:43 -0700 (PDT)
Received: from bfoster (c-24-61-119-116.hsd1.ma.comcast.net. [24.61.119.116])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a05620a20d000b006b95b0a714esm5498036qka.17.2022.09.16.04.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 04:56:42 -0700 (PDT)
Date: Fri, 16 Sep 2022 07:56:39 -0400
From: Brian Foster <bfoster@redhat.com>
To: Sarthak Kukreti <sarthakkukreti@chromium.org>
Message-ID: <YyRkd8YAH1lal8/N@bfoster>
References: <20220915164826.1396245-1-sarthakkukreti@google.com>
 <20220915164826.1396245-5-sarthakkukreti@google.com>
MIME-Version: 1.0
In-Reply-To: <20220915164826.1396245-5-sarthakkukreti@google.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH RFC 4/8] fs: Introduce FALLOC_FL_PROVISION
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
Cc: Jens Axboe <axboe@kernel.dk>, Gwendal Grignou <gwendal@google.com>,
 Theodore Ts'o <tytso@mit.edu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bart Van Assche <bvanassche@google.com>,
 Mike Snitzer <snitzer@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>,
 Daniil Lunev <dlunev@google.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-ext4@vger.kernel.org,
 Evan Green <evgreen@google.com>, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 15, 2022 at 09:48:22AM -0700, Sarthak Kukreti wrote:
> From: Sarthak Kukreti <sarthakkukreti@chromium.org>
> 
> FALLOC_FL_PROVISION is a new fallocate() allocation mode that
> sends a hint to (supported) thinly provisioned block devices to
> allocate space for the given range of sectors via REQ_OP_PROVISION.
> 
> Signed-off-by: Sarthak Kukreti <sarthakkukreti@chromium.org>
> ---
>  block/fops.c                | 7 ++++++-
>  include/linux/falloc.h      | 3 ++-
>  include/uapi/linux/falloc.h | 8 ++++++++
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/block/fops.c b/block/fops.c
> index b90742595317..a436a7596508 100644
> --- a/block/fops.c
> +++ b/block/fops.c
...
> @@ -661,6 +662,10 @@ static long blkdev_fallocate(struct file *file, int mode, loff_t start,
>  		error = blkdev_issue_discard(bdev, start >> SECTOR_SHIFT,
>  					     len >> SECTOR_SHIFT, GFP_KERNEL);
>  		break;
> +	case FALLOC_FL_PROVISION:
> +		error = blkdev_issue_provision(bdev, start >> SECTOR_SHIFT,
> +					       len >> SECTOR_SHIFT, GFP_KERNEL);
> +		break;
>  	default:
>  		error = -EOPNOTSUPP;
>  	}

Hi Sarthak,

Neat mechanism.. I played with something very similar in the past (that
was much more crudely hacked up to target dm-thin) to allow filesystems
to request a thinly provisioned device to allocate blocks and try to do
a better job of avoiding inactivation when overprovisioned.

One thing I'm a little curious about here.. what's the need for a new
fallocate mode? On a cursory glance, the provision mode looks fairly
analogous to normal (mode == 0) allocation mode with the exception of
sending the request down to the bdev. blkdev_fallocate() already maps
some of the logical falloc modes (i.e. punch hole, zero range) to
sending write sames or discards, etc., and it doesn't currently look
like it supports allocation mode, so could it not map such requests to
the underlying REQ_OP_PROVISION op?

I guess the difference would be at the filesystem level where we'd
probably need to rely on a mount option or some such to control whether
traditional fallocate issues provision ops (like you've implemented for
ext4) vs. the specific falloc command, but that seems fairly consistent
with historical punch hole/discard behavior too. Hm? You might want to
cc linux-fsdevel in future posts in any event to get some more feedback
on how other filesystems might want to interact with such a thing.

BTW another thing that might be useful wrt to dm-thin is to support
FALLOC_FL_UNSHARE. I.e., it looks like the previous dm-thin patch only
checks that blocks are allocated, but not whether those blocks are
shared (re: lookup_result.shared). It might be useful to do the COW in
such cases if the caller passes down a REQ_UNSHARE or some such flag.

Brian

> diff --git a/include/linux/falloc.h b/include/linux/falloc.h
> index f3f0b97b1675..a0e506255b20 100644
> --- a/include/linux/falloc.h
> +++ b/include/linux/falloc.h
> @@ -30,7 +30,8 @@ struct space_resv {
>  					 FALLOC_FL_COLLAPSE_RANGE |	\
>  					 FALLOC_FL_ZERO_RANGE |		\
>  					 FALLOC_FL_INSERT_RANGE |	\
> -					 FALLOC_FL_UNSHARE_RANGE)
> +					 FALLOC_FL_UNSHARE_RANGE |                          \
> +					 FALLOC_FL_PROVISION)
>  
>  /* on ia32 l_start is on a 32-bit boundary */
>  #if defined(CONFIG_X86_64)
> diff --git a/include/uapi/linux/falloc.h b/include/uapi/linux/falloc.h
> index 51398fa57f6c..2d323d113eed 100644
> --- a/include/uapi/linux/falloc.h
> +++ b/include/uapi/linux/falloc.h
> @@ -77,4 +77,12 @@
>   */
>  #define FALLOC_FL_UNSHARE_RANGE		0x40
>  
> +/*
> + * FALLOC_FL_PROVISION acts as a hint for thinly provisioned devices to allocate
> + * blocks for the range/EOF.
> + *
> + * FALLOC_FL_PROVISION can only be used with allocate-mode fallocate.
> + */
> +#define FALLOC_FL_PROVISION		0x80
> +
>  #endif /* _UAPI_FALLOC_H_ */
> -- 
> 2.31.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


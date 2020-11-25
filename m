Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCC02C48F0
	for <lists+dm-devel@lfdr.de>; Wed, 25 Nov 2020 21:21:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-eIrh4m81O4Wxy72U4HtmxA-1; Wed, 25 Nov 2020 15:21:12 -0500
X-MC-Unique: eIrh4m81O4Wxy72U4HtmxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E811A1006C97;
	Wed, 25 Nov 2020 20:21:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FE6D1001281;
	Wed, 25 Nov 2020 20:21:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11DED180954D;
	Wed, 25 Nov 2020 20:21:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APKKtP4032436 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 15:20:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA3322166B29; Wed, 25 Nov 2020 20:20:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B54852166B27
	for <dm-devel@redhat.com>; Wed, 25 Nov 2020 20:20:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCF1D811E76
	for <dm-devel@redhat.com>; Wed, 25 Nov 2020 20:20:52 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-2Xjv9w1fMnOhzQ-Of-PQYg-1; Wed, 25 Nov 2020 15:20:47 -0500
X-MC-Unique: 2Xjv9w1fMnOhzQ-Of-PQYg-1
Received: by mail-qv1-f67.google.com with SMTP id 9so1544633qvk.9;
	Wed, 25 Nov 2020 12:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=WSMpmf065AQQA16C6I8/f4Nb2MRTg2VCPV1Y+4Omok0=;
	b=RjjmsC0d3S+D+HztRHnIMCMaHxUKfnsXnyGOYEcWWZU/qujBw/tVHoMJYs2aFECc8k
	gbUofxOto3wsZ2L8N+T2hahQJGRvCHv3ZxLT4VpeRo/PB83W7SszPA+nIEq47kMEUFrx
	hxSJ8aKt1x+Q9SuJggLVVD659vt9JuwI89KIKQ2kBIY6QiWQ3tEU/sv35esCVmxECTRa
	/0OC4M3+9i0E7+Gy/3RE13EV2IymDgVstm4Zsa3z9KXxbKKDgUF/1e4JDo0+9XbXanCn
	ti1+o5+Se7rUAElvh1yo6dH2HWDh3CaQdz5j6fukqKuoKy8CY+RMEbE6ZPKfLtGxZcGG
	jH4g==
X-Gm-Message-State: AOAM531bAXeMQpn+lxd0mlPB55WstBug67kzJYbkelwNzfKB7o7tjCf4
	glxoVxkNa5SETWbA4Cv2/ZY5+xXtlwcnSg==
X-Google-Smtp-Source: ABdhPJxGb7WJXeWnQukVsz1bsvc4/cmOCaTprUECQMhH8XohgWi8umM00Y/Xc9aCwh7r/SWLyDpYFQ==
X-Received: by 2002:a0c:b505:: with SMTP id d5mr4999671qve.59.1606335647135;
	Wed, 25 Nov 2020 12:20:47 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
	by smtp.gmail.com with ESMTPSA id y44sm486168qtb.50.2020.11.25.12.20.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Nov 2020 12:20:46 -0800 (PST)
Date: Wed, 25 Nov 2020 15:20:23 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <X768hzEnD/ySog5b@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
	<20201124132751.3747337-26-hch@lst.de>
	<X714udEyPuGarVYp@mtj.duckdns.org> <20201125164515.GB1975@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201125164515.GB1975@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 25/45] block: reference struct block_device
 from struct hd_struct
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Wed, Nov 25, 2020 at 05:45:15PM +0100, Christoph Hellwig wrote:
> On Tue, Nov 24, 2020 at 04:18:49PM -0500, Tejun Heo wrote:
> > Hello,
> > 
> > Please see lkml.kernel.org/r/X708BTJ5njtbC2z1@mtj.duckdns.org for a few nits
> > on the previous version.
> 
> Thanks, I've addressed the mapping_set_gfp mask nit and updated the
> commit log.  As Jan pointed also pointed out I think we do need the
> remove_inode_hash.

Agreed. It'd be nice to replace the stale comment.

> > Also, would it make sense to separate out lookup_sem removal? I *think* it's
> > there to ensure that the same bdev doesn't get associated with old and new
> > gendisks at the same time but can't wrap my head around how it works
> > exactly. I can see that this may not be needed once the lifetimes of gendisk
> > and block_devices are tied together but that may warrant a bit more
> > explanation.
> 
> Jan added lookup_sem in commit 56c0908c855afbb to prevent a three way
> race between del_gendisk and blkdev_open due to the weird bdev vs
> gendisk lifetime rules.  None of that can happen with the new lookup
> scheme.

Understood. I think it'd be worthwhile to note that in the commit log.

Thanks.

-- 
tejun

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


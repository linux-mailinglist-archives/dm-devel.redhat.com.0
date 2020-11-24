Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBAE2C3271
	for <lists+dm-devel@lfdr.de>; Tue, 24 Nov 2020 22:20:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-GMF8_nbNNyyeNirG7Qwurw-1; Tue, 24 Nov 2020 16:20:32 -0500
X-MC-Unique: GMF8_nbNNyyeNirG7Qwurw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C71FF18C89DF;
	Tue, 24 Nov 2020 21:20:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A543B60BE5;
	Tue, 24 Nov 2020 21:20:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 091D74A7C6;
	Tue, 24 Nov 2020 21:20:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOLKMW4021225 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 16:20:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C9D2F2166B2A; Tue, 24 Nov 2020 21:20:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C202166B27
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 21:20:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A71938007DF
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 21:20:20 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-lgvFNbXGP76wRX0vOTWG1w-1; Tue, 24 Nov 2020 16:20:17 -0500
X-MC-Unique: lgvFNbXGP76wRX0vOTWG1w-1
Received: by mail-qv1-f67.google.com with SMTP id 62so1145023qva.11;
	Tue, 24 Nov 2020 13:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=3HC7ZqQanyIo8VeBYdMEle4L/4ENFYEM5MkKt8pSh/w=;
	b=hLxkQ/STjOicu9VPPY8bWGTuj7RjSkm+4TJX94aC2Ea5gOYNGu8TsP0jBzeR4lxDXS
	iV3ivW59E3zk0FL+VcJtantnLsJ9J+1jl9brWUJd10uFVUA/ZUTCQsWJBJYw2ALutT8k
	fUjxKY4FvQCATAe1I5z7QMVHjnbsaV5fjqGPX1AdGvl70W50P4V9rcYrqKhsLCpRI3n+
	90My3/MJ015Cs8V9ZVCW/oXIXP/Y8LQJP0FIKLuzv961LiEnbvu9i50/NUHJv1ZqQ+rI
	KRc49rfc0zOlqlhLzAjkQupGTtbuyXp1iBPE7vvpcbAbpGGICr0nwR5xLB8qaHK4tZvf
	ENwQ==
X-Gm-Message-State: AOAM533DBKJamgkcZVsN5e7Y3vlrPyyphDp5XF18XzOrTXNJxxoGPXbt
	U+cxg9XN1mPbWCEk5UWJtmQ=
X-Google-Smtp-Source: ABdhPJxH3CMpes4k7VUBJmRwBA7xuLJPWwlXmpOLLvAcoVgK+lPVzlEL/k+veWQQUizcViCkQhf2+Q==
X-Received: by 2002:a05:6214:2a1:: with SMTP id m1mr370118qvv.35.1606252816750;
	Tue, 24 Nov 2020 13:20:16 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
	by smtp.gmail.com with ESMTPSA id o16sm451985qkg.27.2020.11.24.13.20.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Nov 2020 13:20:16 -0800 (PST)
Date: Tue, 24 Nov 2020 16:19:53 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <X714+RhOhKVlNrAo@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
	<20201124132751.3747337-28-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-28-hch@lst.de>
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
Subject: Re: [dm-devel] [PATCH 27/45] block: simplify the block device
	claiming interface
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2020 at 02:27:33PM +0100, Christoph Hellwig wrote:
> Stop passing the whole device as a separate argument given that it
> can be trivially deducted and cleanup the !holder debug check.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


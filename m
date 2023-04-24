Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7744E6EC62C
	for <lists+dm-devel@lfdr.de>; Mon, 24 Apr 2023 08:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682317357;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/KrJrXl3trvMZ6JVEEdWmZQDca3r83AOpNejFpGBthE=;
	b=RubKc+efk1TWdlsc9r7Olt8YlxGS21SOnfMXx7P0WrIKVTfDJX97XOY8qYD5BM0fUV0xFo
	H4M+eIc13An+/cnCg1gaZOi6pUSYHmgGJYuUZvKtw8si5MD2Z8C2Aw3zUx56zmw3prwb7c
	n2QHI5t8e1oTAANysAzV8+pJW6Uw1Bw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-srgryBlsMqimget-AgTNuw-1; Mon, 24 Apr 2023 02:22:33 -0400
X-MC-Unique: srgryBlsMqimget-AgTNuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD543101A551;
	Mon, 24 Apr 2023 06:22:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4199814171FF;
	Mon, 24 Apr 2023 06:22:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 074061946A46;
	Mon, 24 Apr 2023 06:22:28 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E1161946586
 for <dm-devel@listman.corp.redhat.com>; Mon, 24 Apr 2023 06:22:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2BF6D2027043; Mon, 24 Apr 2023 06:22:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2441F2027046
 for <dm-devel@redhat.com>; Mon, 24 Apr 2023 06:22:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4DE03806703
 for <dm-devel@redhat.com>; Mon, 24 Apr 2023 06:22:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-CKpOnGWPPimjfoBt2-B4UQ-1; Mon, 24 Apr 2023 02:22:25 -0400
X-MC-Unique: CKpOnGWPPimjfoBt2-B4UQ-1
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pqpAv-00FPys-1e; Mon, 24 Apr 2023 05:55:45 +0000
Date: Sun, 23 Apr 2023 22:55:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <ZEYZ4ScVDXviFJ/J@infradead.org>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
 <20230421195807.2804512-4-mcgrof@kernel.org>
 <ZELuiBNNHTk4EdxH@casper.infradead.org>
 <ZEMH9h/cd9Cp1t+X@bombadil.infradead.org>
 <20230421223420.GH3223426@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20230421223420.GH3223426@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH 3/5] iomap: simplify iomap_init() with
 PAGE_SECTORS
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
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
 dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
 christoph.boehmwalder@linbit.com, Matthew Wilcox <willy@infradead.org>,
 hch@infradead.org, p.raghav@samsung.com, senozhatsky@chromium.org,
 snitzer@kernel.org, linux-block@vger.kernel.org, kbusch@kernel.org,
 axboe@kernel.dk, da.gomez@samsung.com, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, minchan@kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, patches@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, lars.ellenberg@linbit.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 22, 2023 at 08:34:20AM +1000, Dave Chinner wrote:
> > 
> > -	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
> > +	return bioset_init(&iomap_ioend_bioset, 4 * PAGE_SECTORS,
> 
> Yes, please.
> 
> > The shift just seemed optimal if we're just going to change it.
> 
> Nope, it's just premature optimisation at the expense of
> maintainability. The compiler will optimise the multiplication into
> shifts if that is the fastest way to do it for the given
> architecture the code is being compiled to.

We still had cases of the compiler not doing obvious
multiplication/division to shift conversion lately.  That being said:

 1) this is an initialization path, no one actually cares
 2) we're dealing with constants here, and compilers are really good
    at constant folding

so yes, this should be using the much more readable version.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


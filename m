Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DEDC040CBE7
	for <lists+dm-devel@lfdr.de>; Wed, 15 Sep 2021 19:47:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-3xawomsNMgyZUQa9Y6fZgQ-1; Wed, 15 Sep 2021 13:47:17 -0400
X-MC-Unique: 3xawomsNMgyZUQa9Y6fZgQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F9D05074B;
	Wed, 15 Sep 2021 17:47:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDBE86A257;
	Wed, 15 Sep 2021 17:47:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80E1B4EA2A;
	Wed, 15 Sep 2021 17:46:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FHfBo7009795 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 13:41:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CC56207ADDA; Wed, 15 Sep 2021 17:41:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 087E4207AD11
	for <dm-devel@redhat.com>; Wed, 15 Sep 2021 17:41:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2BED18A01AC
	for <dm-devel@redhat.com>; Wed, 15 Sep 2021 17:41:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-255-u55uzWvsNQ27fMSBYlTzrQ-1;
	Wed, 15 Sep 2021 13:41:06 -0400
X-MC-Unique: u55uzWvsNQ27fMSBYlTzrQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 977B36103C;
	Wed, 15 Sep 2021 17:41:04 +0000 (UTC)
Date: Wed, 15 Sep 2021 10:40:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YUIwJQT9CnIoT7WO@sol.localdomain>
References: <20210913013135.102404-1-ebiggers@kernel.org>
	<20210913013135.102404-4-ebiggers@kernel.org>
	<YUGkfDmGa3WKz8cD@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YUGkfDmGa3WKz8cD@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Satya Tangirala <satyaprateek2357@gmail.com>,
	dm-devel@redhat.com, linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 3/5] blk-crypto: rename keyslot-manager files
 to blk-crypto-profile
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 15, 2021 at 08:45:00AM +0100, Christoph Hellwig wrote:
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> It would be nice to keep the blk-crypto* includes together, though.

I don't see any case in which they aren't together.  Unless you're talking about
blk-crypto-internal.h, which is a directory-local header so it doesn't get
grouped with the <linux/*.h> headers.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


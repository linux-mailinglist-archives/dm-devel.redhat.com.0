Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB71436845
	for <lists+dm-devel@lfdr.de>; Thu, 21 Oct 2021 18:47:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-ud0sDWOPPCSA7M1j609LDA-1; Thu, 21 Oct 2021 12:47:21 -0400
X-MC-Unique: ud0sDWOPPCSA7M1j609LDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6D61006AA2;
	Thu, 21 Oct 2021 16:47:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69CDA69CBE;
	Thu, 21 Oct 2021 16:47:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 983E14A703;
	Thu, 21 Oct 2021 16:46:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LGkhEK009698 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 12:46:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 898C340CFD11; Thu, 21 Oct 2021 16:46:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8496740CFD08
	for <dm-devel@redhat.com>; Thu, 21 Oct 2021 16:46:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FFF7811E80
	for <dm-devel@redhat.com>; Thu, 21 Oct 2021 16:46:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-314-VMS7gUXbNL6IKRlrJVjwng-1;
	Thu, 21 Oct 2021 12:46:41 -0400
X-MC-Unique: VMS7gUXbNL6IKRlrJVjwng-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67F4F61881;
	Thu, 21 Oct 2021 16:46:40 +0000 (UTC)
Date: Thu, 21 Oct 2021 09:46:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <YXGZbvTQBgtaPojY@gmail.com>
References: <20211018180453.40441-1-ebiggers@kernel.org>
	<YW24UuB8dLWwl9ni@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <YW24UuB8dLWwl9ni@sol.localdomain>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Satya Tangirala <satyaprateek2357@gmail.com>,
	dm-devel@redhat.com, linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v6 0/4] blk-crypto cleanups
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

On Mon, Oct 18, 2021 at 11:09:22AM -0700, Eric Biggers wrote:
> On Mon, Oct 18, 2021 at 11:04:49AM -0700, Eric Biggers wrote:
> > 
> > This series applies to block/for-next.
> > 
> > Changed v5 => v6:
> >   - Rebased onto block/for-next yet again
> >   - Added more Reviewed-by tags
> > 
> > Changed v4 => v5:
> >   - Rebased onto block/for-next again
> >   - Added Reviewed-by tags
> > 
> > Changed v3 => v4:
> >   - Rebased onto block/for-next to resolve a conflict due to
> >     'struct request' being moved.
> 
> Jens, I keep having to rebase this patchset.  Is there anything else you're
> waiting for before applying it for 5.16?  Thanks!
> 
> - Eric

Ping?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


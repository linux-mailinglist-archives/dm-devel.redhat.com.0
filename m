Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 533DF283CB0
	for <lists+dm-devel@lfdr.de>; Mon,  5 Oct 2020 18:43:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-umkWwB1AMzaNJc4sJCSrlA-1; Mon, 05 Oct 2020 12:43:25 -0400
X-MC-Unique: umkWwB1AMzaNJc4sJCSrlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD676107B270;
	Mon,  5 Oct 2020 16:43:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0176C5576D;
	Mon,  5 Oct 2020 16:43:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D65A044A65;
	Mon,  5 Oct 2020 16:42:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 095GgeD8007591 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Oct 2020 12:42:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D11552166B28; Mon,  5 Oct 2020 16:42:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD19F2166BA2
	for <dm-devel@redhat.com>; Mon,  5 Oct 2020 16:42:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B72D8186E136
	for <dm-devel@redhat.com>; Mon,  5 Oct 2020 16:42:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-292-EGPSX8WFOpyHGRTdK_Od9g-1;
	Mon, 05 Oct 2020 12:42:32 -0400
X-MC-Unique: EGPSX8WFOpyHGRTdK_Od9g-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7628920774;
	Mon,  5 Oct 2020 16:42:31 +0000 (UTC)
Date: Mon, 5 Oct 2020 09:42:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20201005164229.GA3128920@gmail.com>
References: <20200916035315.34046-1-ebiggers@kernel.org>
	<20200928205934.GA1340@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200928205934.GA1340@sol.localdomain>
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
Cc: linux-block@vger.kernel.org, Miaohe Lin <linmiaohe@huawei.com>,
	dm-devel@redhat.com, Satya Tangirala <satyat@google.com>
Subject: Re: [dm-devel] [PATCH v2 0/3] block: fix up bio_crypt_ctx allocation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 28, 2020 at 01:59:34PM -0700, Eric Biggers wrote:
> On Tue, Sep 15, 2020 at 08:53:12PM -0700, Eric Biggers wrote:
> > This series makes allocation of encryption contexts either able to fail,
> > or explicitly require __GFP_DIRECT_RECLAIM (via WARN_ON_ONCE).
> > 
> > This applies to linux-block/for-next.
> > 
> > Changed since v1 (https://lkml.kernel.org/r/20200902051511.79821-1-ebiggers@kernel.org):
> >     - Added patches 2 and 3.
> >     - Added kerneldoc for bio_crypt_clone().
> >     - Adjusted commit message.
> > 
> > Eric Biggers (3):
> >   block: make bio_crypt_clone() able to fail
> >   block: make blk_crypto_rq_bio_prep() able to fail
> >   block: warn if !__GFP_DIRECT_RECLAIM in bio_crypt_set_ctx()
> 
> Jens, any interest in applying these patches for 5.10?
> 

Ping.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


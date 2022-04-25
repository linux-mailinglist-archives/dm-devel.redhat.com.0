Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD6450DE6D
	for <lists+dm-devel@lfdr.de>; Mon, 25 Apr 2022 13:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650884660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M2K6jo5neO6kB4emM6FFV57I/xfPZDaDsWqM7qu+szY=;
	b=LmMLc0aUbgGlvKISLNAhTYSzLyl6dbjrW+cheIYlXWQ9+Bu8X9JVf4IGQPjgoCz4k+6ozk
	OoypuToLQeWWKGqiU9sIphmxy6Xzoub3MDOClZsndQZLMlO+X31OVwydMYi7cF2r9OM2F6
	0lJMntOvwinXrarQKay0fNmvXfqFg9A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-TnHlsPkfMNiKBnJFP3vw1Q-1; Mon, 25 Apr 2022 07:04:17 -0400
X-MC-Unique: TnHlsPkfMNiKBnJFP3vw1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 572C7185A79C;
	Mon, 25 Apr 2022 11:04:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89BA42024CD0;
	Mon, 25 Apr 2022 11:04:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 162001940358;
	Mon, 25 Apr 2022 11:04:08 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 89F611947BBE
 for <dm-devel@listman.corp.redhat.com>; Mon, 25 Apr 2022 11:04:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 294AD463DF5; Mon, 25 Apr 2022 11:04:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 191FA401475;
 Mon, 25 Apr 2022 11:04:06 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 23PB463w025596; Mon, 25 Apr 2022 07:04:06 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 23PB45Cv025592; Mon, 25 Apr 2022 07:04:05 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 25 Apr 2022 07:04:05 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: David Laight <David.Laight@ACULAB.COM>
In-Reply-To: <789f0463ce974e90a93f4dbf8c471156@AcuMS.aculab.com>
Message-ID: <alpine.LRH.2.02.2204250701410.10912@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2204241648270.17244@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHk-=wh+Z+OKH3jRttWGHbWSQq2wVMtdnA=ntDiadZu=VxAC7w@mail.gmail.com>
 <CAHk-=wibmkFz6dybsdpW_3kUnV20FhJazerWDcbm7yCp_Xv+CA@mail.gmail.com>
 <789f0463ce974e90a93f4dbf8c471156@AcuMS.aculab.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH] hex2bin: make the function hex_to_bin
 constant-time
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
Cc: Andy Shevchenko <andy@kernel.org>, Mike Snitzer <msnitzer@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Milan Broz <gmazyland@gmail.com>,
 device-mapper development <dm-devel@redhat.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 25 Apr 2022, David Laight wrote:

> From: Linus Torvalds
> > Sent: 24 April 2022 22:42
> > 
> > On Sun, Apr 24, 2022 at 2:37 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > Finally, for the same reason - please don't use ">> 8".  Because I do
> > > not believe that bit 8 is well-defined in your arithmetic. The *sign*
> > > bit will be, but I'm not convinced bit 8 is.
> > 
> > Hmm.. I think it's ok. It can indeed overflow in 'char' and change the
> > sign in bit #7, but I suspect bit #8 is always fine.
> > 
> > Still, If you want to just extend the sign bit, ">> 31" _is_ the
> > obvious thing to use (yeah, yeah, properly "sizeof(int)*8-1" or
> > whatever, you get my drift).
> 
> Except that right shifts of signed values are UB.
> In particular it has always been valid to do an unsigned
> shift right on a 2's compliment negative number.
> 
> 	David

Yes. All the standard versions (C89, C99, C11, C2X) say that right shift 
of a negative value is implementation-defined.

So, we should cast it to "unsigned" before shifting it.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


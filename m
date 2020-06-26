Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 395AC20B455
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 17:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593184709;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0lzrwVuNLij4P0x7H0nvv2M85Ife9shp7ePl9p6qwYw=;
	b=Godwfc0HtYY3qd5DzKTbC5jd5v8CGV/6QLHZoMF1BwtHkDni3gr+F0RO02gUXWAGHm5/U0
	h3XF6PnZvsjRvGme/jCiSyIEs44uQtGHZU/o32vydFzAwKCqqV/Ez+TOBMAp7cVprnE7/C
	OgSL1H7r+dPI7LI5LwEt0KgqjGI3wbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-tleTpSEnOzCgtW3DW7xg3w-1; Fri, 26 Jun 2020 11:18:27 -0400
X-MC-Unique: tleTpSEnOzCgtW3DW7xg3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F688107ACCA;
	Fri, 26 Jun 2020 15:18:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D94A80881;
	Fri, 26 Jun 2020 15:18:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E18C58759A;
	Fri, 26 Jun 2020 15:18:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QFI2mI005876 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 11:18:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9696C5C6C0; Fri, 26 Jun 2020 15:18:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 814FC5C557;
	Fri, 26 Jun 2020 15:17:58 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05QFHwaF013492; Fri, 26 Jun 2020 11:17:58 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05QFHuir013488; Fri, 26 Jun 2020 11:17:56 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 26 Jun 2020 11:17:56 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Herbert Xu <herbert@gondor.apana.org.au>
In-Reply-To: <20200626044534.GA2870@gondor.apana.org.au>
Message-ID: <alpine.LRH.2.02.2006261109520.11899@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616173620.GA207319@gmail.com>
	<alpine.LRH.2.02.2006171107220.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626044534.GA2870@gondor.apana.org.au>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Zaibo Xu <xuzaibo@Huawei.com>,
	linux-kernel@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
	Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] crypto: pass the flag
	CRYPTO_ALG_ALLOCATES_MEMORY
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 26 Jun 2020, Herbert Xu wrote:

> On Wed, Jun 17, 2020 at 11:09:28AM -0400, Mikulas Patocka wrote:
> >
> > Index: linux-2.6/include/linux/crypto.h
> > ===================================================================
> > --- linux-2.6.orig/include/linux/crypto.h
> > +++ linux-2.6/include/linux/crypto.h
> > @@ -97,9 +97,18 @@
> >  #define CRYPTO_ALG_OPTIONAL_KEY		0x00004000
> >  
> >  /*
> > + * The driver may allocate memory during request processing, so it shouldn't be
> > + * used in cases where memory allocation failures aren't acceptable, such as
> > + * during block device encryption.
> > + */
> > +#define CRYPTO_ALG_ALLOCATES_MEMORY	0x00008000
> > +
> > +/*
> >   * Don't trigger module loading
> >   */
> > -#define CRYPTO_NOLOAD			0x00008000
> > +#define CRYPTO_NOLOAD			0x00010000
> > +
> > +#define CRYPTO_ALG_INHERITED_FLAGS	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY)
> 
> Any reason why you need to renumber NOLOAD? If not please keep
> the existing values.

There is no hard reason for that. CRYPTO_NOLOAD is a "virtual" flag that 
could be only present in crypto algorithm requests and I thought that the 
intention was that the virtual flags go after real flags. If you don't 
want to change existing flags, there is no problem with that.

Mikulas

> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


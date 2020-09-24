Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3F637276C0B
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 10:33:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-LIgYLORYNS-YlNyD5ia-Hg-1; Thu, 24 Sep 2020 04:33:29 -0400
X-MC-Unique: LIgYLORYNS-YlNyD5ia-Hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E580281CAFB;
	Thu, 24 Sep 2020 08:33:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0C021002C04;
	Thu, 24 Sep 2020 08:33:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B2FC8C7A1;
	Thu, 24 Sep 2020 08:33:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O7HYkE007515 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 03:17:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6D41200A7CD; Thu, 24 Sep 2020 07:17:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0227201E730
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 07:17:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C9648007DF
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 07:17:30 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-273-r7U_UGo9MMa-pR4KVOY78w-1; Thu, 24 Sep 2020 03:17:27 -0400
X-MC-Unique: r7U_UGo9MMa-pR4KVOY78w-1
Received: by mail-pj1-f66.google.com with SMTP id mm21so1192875pjb.4
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 00:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=CFgKLZ7Chsmv5ba86marh1hlJNBQ4kPm3t3GCKLPml0=;
	b=qzaVFGSJ668SCFERy+xFA/n5UGPw7WCETpr8G+g2RZgk4kE148cWcggqc12SxSPEow
	Z7wsynLL16GI7QiEWgMJvZQbDPDE3EXxYFdrEHTwxTr1+dB41Gx1/4/qELsaIsH4pCjn
	8S0wCKlYntFvpP4q2kGYGJR3C4Tg08hJwRFG2zFmAybFgHPV9ZqdsOaDFXBbFjggtMCf
	coYuni5V3rXrWc9hHd2u1e5xp8oisgX7vDEhfUuh9EifW3RgQxCqaxx60vgXAkPjUe+h
	olnj6JG/L8iXbvkKyTVLywwnAnJDBL3spNhfwmXWzMW6h3/xIaa+JuGdbneU5gR9qLRM
	RU6Q==
X-Gm-Message-State: AOAM533HxetU+bIO0se0ODI2Khufd7JQ68enyVcrxUTwrfrlPBUNluTS
	mg7mjeS7qwpaEuD3xQn1d8Q4nw==
X-Google-Smtp-Source: ABdhPJxQiQR+5YMuZzB7wYPdkRNQV4iS231LLBb539HsxqXhmnu9M/EZBMrF5eFgYRnlpfZ3ffkakg==
X-Received: by 2002:a17:902:d68c:b029:d2:23a6:f6d7 with SMTP id
	v12-20020a170902d68cb02900d223a6f6d7mr3360335ply.45.1600931846100;
	Thu, 24 Sep 2020 00:17:26 -0700 (PDT)
Received: from google.com (124.190.199.35.bc.googleusercontent.com.
	[35.199.190.124]) by smtp.gmail.com with ESMTPSA id
	q193sm1724860pfq.127.2020.09.24.00.17.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Sep 2020 00:17:25 -0700 (PDT)
Date: Thu, 24 Sep 2020 07:17:21 +0000
From: Satya Tangirala <satyat@google.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200924071721.GA1883346@google.com>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-3-satyat@google.com>
	<20200922003255.GC32959@sol.localdomain>
	<20200924011438.GD10500@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924011438.GD10500@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 24 Sep 2020 04:31:06 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] dm: add support for passing through
 inline crypto support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 23, 2020 at 09:14:39PM -0400, Mike Snitzer wrote:
> On Mon, Sep 21 2020 at  8:32pm -0400,
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > On Wed, Sep 09, 2020 at 11:44:21PM +0000, Satya Tangirala wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > Update the device-mapper core to support exposing the inline crypto
> > > support of the underlying device(s) through the device-mapper device.
> > > 
> > > This works by creating a "passthrough keyslot manager" for the dm
> > > device, which declares support for encryption settings which all
> > > underlying devices support.  When a supported setting is used, the bio
> > > cloning code handles cloning the crypto context to the bios for all the
> > > underlying devices.  When an unsupported setting is used, the blk-crypto
> > > fallback is used as usual.
> > > 
> > > Crypto support on each underlying device is ignored unless the
> > > corresponding dm target opts into exposing it.  This is needed because
> > > for inline crypto to semantically operate on the original bio, the data
> > > must not be transformed by the dm target.  Thus, targets like dm-linear
> > > can expose crypto support of the underlying device, but targets like
> > > dm-crypt can't.  (dm-crypt could use inline crypto itself, though.)
> > > 
> > > When a key is evicted from the dm device, it is evicted from all
> > > underlying devices.
> > > 
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > Co-developed-by: Satya Tangirala <satyat@google.com>
> > > Signed-off-by: Satya Tangirala <satyat@google.com>
> > 
> > Looks good as far as Satya's changes from my original patch are concerned.
> > 
> > Can the device-mapper maintainers take a look at this?
> 
> In general it looks like these changes were implemented very carefully
> and are reasonable if we _really_ want to enable passing through inline
> crypto.
> 
> I do have concerns about the inability to handle changes at runtime (due
> to a table reload that introduces new devices without the encryption
> settings the existing devices in the table are using).  But the fallback
> mechanism saves it from being a complete non-starter.
Unfortunately, the fallback doesn't completely handle that situation
right now. The DM device could be suspended while an upper layer like
fscrypt is doing something like "checking if encryption algorithm 'A'
is supported by the DM device". It's possible that fscrypt thinks
the DM device supports 'A' even though the DM device is suspended, and
the table is about to be reloaded to introduce a new device that doesn't
support 'A'. Before the DM device is resumed with the new table, fscrypt
might send a bio that uses encryption algorithm 'A' without initializing
the blk-crypto-fallback ciphers for 'A', because it believes that the DM
device supports 'A'. When the bio gets processed by the DM (or when
blk-crypto does its checks to decide whether to use the fallback on that
bio), the bio will fail because the fallback ciphers aren't initialized.

Off the top of my head, one thing we could do is to always allocate the
fallback ciphers when the device mapper is the target device for the bio
(by maybe adding a "encryption_capabilities_may_change_at_runtime" flag
to struct blk_keyslot_manager that the DM will set to true, and that
the block layer will check for and decide to appropriately allocate
the fallback ciphers), although this does waste memory on systems
where we know the DM device tables will never change....

This patch also doesn't handle the case when the encryption capabilities
of the new table are a superset of the old capabilities.  Currently, a
DM device's capabilities can only shrink after the device is initially
created. They can never "expand" to make use of capabilities that might
be added due to introduction of new devices via table reloads.  I might
be forgetting something I thought of before, but looking at it again
now, I don't immediately see anything wrong with expanding the
advertised capabilities on table reload....I'll look carefully into that
again.
> 
> Can you help me better understand the expected consumer of this code?
> If you have something _real_ please be explicit.  It makes justifying
> supporting niche code like this more tolerable.
So the motivation for this code was that Android currently uses a device
mapper target on top of a phone's disk for user data. On many phones,
that disk has inline encryption support, and it'd be great to be able to
make use of that. The DM device configuration isn't changed at runtime.
> 
> Thanks,
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


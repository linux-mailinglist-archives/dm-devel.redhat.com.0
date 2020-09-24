Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EF67427775D
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 19:03:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-oxUOnsS1Pgm4OUWbA1LlBw-1; Thu, 24 Sep 2020 13:02:59 -0400
X-MC-Unique: oxUOnsS1Pgm4OUWbA1LlBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B83A8D2116;
	Thu, 24 Sep 2020 17:02:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1FFB7CD46;
	Thu, 24 Sep 2020 17:02:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C15AC8C7A1;
	Thu, 24 Sep 2020 17:02:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OGvcXw020571 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 12:57:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A973A20244F7; Thu, 24 Sep 2020 16:57:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4C352028E91
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 16:57:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FC2880029D
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 16:57:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-306-TQrXjbFUPJGqZvqNlratqg-1;
	Thu, 24 Sep 2020 12:57:34 -0400
X-MC-Unique: TQrXjbFUPJGqZvqNlratqg-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4537D2311A;
	Thu, 24 Sep 2020 16:57:32 +0000 (UTC)
Date: Thu, 24 Sep 2020 09:57:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200924165730.GA2865480@gmail.com>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-3-satyat@google.com>
	<20200922003255.GC32959@sol.localdomain>
	<20200924011438.GD10500@redhat.com>
	<20200924071721.GA1883346@google.com>
	<20200924134649.GB13849@redhat.com>
	<20200924154550.GA1266@sol.localdomain>
	<20200924161624.GC14369@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924161624.GC14369@redhat.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 12:16:24PM -0400, Mike Snitzer wrote:
> On Thu, Sep 24 2020 at 11:45am -0400,
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > On Thu, Sep 24, 2020 at 09:46:49AM -0400, Mike Snitzer wrote:
> > > > > Can you help me better understand the expected consumer of this code?
> > > > > If you have something _real_ please be explicit.  It makes justifying
> > > > > supporting niche code like this more tolerable.
> > > >
> > > > So the motivation for this code was that Android currently uses a device
> > > > mapper target on top of a phone's disk for user data. On many phones,
> > > > that disk has inline encryption support, and it'd be great to be able to
> > > > make use of that. The DM device configuration isn't changed at runtime.
> > > 
> > > OK, which device mapper target is used?
> > 
> > There are several device-mapper targets that Android can require for the
> > "userdata" partition -- potentially in a stack of more than one:
> > 
> > dm-linear: required for Dynamic System Updates
> > (https://developer.android.com/topic/dsu)
> > 
> > dm-bow: required for User Data Checkpoints on ext4
> > (https://source.android.com/devices/tech/ota/user-data-checkpoint)
> > (https://patchwork.kernel.org/patch/10838743/)
> > 
> > dm-default-key: required for metadata encryption
> > (https://source.android.com/security/encryption/metadata)
> 
> Please work with all google stakeholders to post the latest code for the
> dm-bow and dm-default-key targets and I'll work through them.
> 
> I think the more code we have to inform DM core's implementation the
> better off we'll be in the long run.  Could also help improve these
> targets as a side-effect of additional review.
> 
> I know I largely ignored dm-bow before but that was more to do with
> competing tasks, etc.  I'll try my best...

I'm not sure what happened with dm-bow; I'll check with the person maintaining
it.

We expect that dm-default-key would be controversial, since it's sort of a
layering violation; metadata encryption really should be a filesystem-level
thing.  Satya has been investigating implementing it in filesystems instead.
I think we need to see how that turns out first.

> > We're already carrying this patchset in the Android common kernels since late
> > last year, as it's required for inline encryption to work when any of the above
> > is used.  So this is something that is needed and is already being used.
> > 
> > Now, you don't have to "count" dm-bow and dm-default-key since they aren't
> > upstream; that leaves dm-linear.  But hopefully the others at least show that
> > architecturally, dm-linear is just the initial use case, and this patchset also
> > makes it easy to pass through inline crypto on any other target that can support
> > it (basically, anything that doesn't change the data itself as it goes through).
> 
> Sure, that context really helps.
> 
> About "basically, anything that doesn't change the data itself as it
> goes through": could you be a bit more precise?  Very few DM targets
> actually change the data as associated bios are remapped.
> 
> I'm just wondering if your definition of "doesn't change the data"
> includes things more subtle than the data itself?

The semantics expected by upper layers (e.g. filesystems) are that a "write" bio
that has an encryption context is equivalent to a "write" bio with no encryption
context that contains the data already encrypted.  Similarly, a "read" bio with
an encryption context is equivalent to submitting a "read" bio with no
encryption context, then decrypting the resulting data.

blk-crypto-fallback obviously works in that way.  However, when actual inline
encryption hardware is used, the encryption/decryption actually happens at the
lowest level in the stack.

To maintain the semantics in that case, the data can't be modified anywhere in
the stack.  For example, if the data also passes through a dm-crypt target that
encrypted/decrypted the data (again) in software, that would break things.

You're right that it's a bit more than that, though.  The targets also have to
behave the same way regardless of whether the data is already encrypted or not.
So if e.g. a target hashes the data, then it can't set
may_passthrough_inline_crypto, even if it doesn't change the data.  It can't
sometimes be hashing the plaintext data and sometimes the ciphertext data.
(And also, storing hashes of the plaintext on-disk would be insecure, as it
would leak information that encryption is meant to protect.)

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


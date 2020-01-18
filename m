Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 63C9D1418CF
	for <lists+dm-devel@lfdr.de>; Sat, 18 Jan 2020 18:51:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579369899;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mmXRIZNMA0VCiZ25MlRL+MU4hdMqQ3UABgdQnBAQVYU=;
	b=dCAL2xmQ1eaMN9me87gIezQcrAiVBdE+wl2uHX1DWiqEUmHlIFNHov72ukEV5vtZhz64WC
	rZ49otw6cIReTajhx7YsvvbEhFgF5wy2SiNAopwUi5SHmMJxcqc4BLiX63Y1TdXEvxCg8z
	QK4rVKeFIo3bteyCERs/MJJZ/SFiRYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-apXy8GN1NveuP0pi3SqaXA-1; Sat, 18 Jan 2020 12:51:37 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F1E5107ACC4;
	Sat, 18 Jan 2020 17:51:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2622E19C4F;
	Sat, 18 Jan 2020 17:51:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F96718089C8;
	Sat, 18 Jan 2020 17:51:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00IHpHqa021480 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 18 Jan 2020 12:51:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A475310DCF49; Sat, 18 Jan 2020 17:51:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8ED10DCF47
	for <dm-devel@redhat.com>; Sat, 18 Jan 2020 17:51:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D72708E3897
	for <dm-devel@redhat.com>; Sat, 18 Jan 2020 17:51:15 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-205-teWGYouWM4abw122_pi0Ag-1;
	Sat, 18 Jan 2020 12:51:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7F9CB8EE2AB; 
	Sat, 18 Jan 2020 09:51:08 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4aWzOveehLuA; Sat, 18 Jan 2020 09:51:08 -0800 (PST)
Received: from jarvis.lan (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id E43F88EE17D;
	Sat, 18 Jan 2020 09:51:06 -0800 (PST)
Message-ID: <1579369864.3421.16.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Franck Lenormand <franck.lenormand@nxp.com>, David Howells
	<dhowells@redhat.com>
Date: Sat, 18 Jan 2020 09:51:04 -0800
In-Reply-To: <AM6PR04MB54473C2D30DDD7CDC8522DF9924C0@AM6PR04MB5447.eurprd04.prod.outlook.com>
References: <1551456599-10603-1-git-send-email-franck.lenormand@nxp.com>
	<11177.1551893395@warthog.procyon.org.uk>
	<AM6PR04MB54473C2D30DDD7CDC8522DF9924C0@AM6PR04MB5447.eurprd04.prod.outlook.com>
Mime-Version: 1.0
X-MC-Unique: teWGYouWM4abw122_pi0Ag-1
X-MC-Unique: apXy8GN1NveuP0pi3SqaXA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00IHpHqa021480
X-loop: dm-devel@redhat.com
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
	Horia Geanta <horia.geanta@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jmorris@namei.org" <jmorris@namei.org>,
	"linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>,
	"keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
	Ninno <silvano.dininno@nxp.com>, Silvano,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"agk@redhat.com" <agk@redhat.com>, "serge@hallyn.com" <serge@hallyn.com>
Subject: Re: [dm-devel] [RFC PATCH 0/2] Create CAAM HW key in linux keyring
 and use in dmcrypt
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2019-03-07 at 13:17 +0000, Franck Lenormand wrote:
> > -----Original Message-----
> > From: David Howells <dhowells@redhat.com>
> > Sent: Wednesday, March 6, 2019 6:30 PM
> > To: Franck Lenormand <franck.lenormand@nxp.com>
> > Cc: dhowells@redhat.com; linux-kernel@vger.kernel.org; linux-
> > security-
> > module@vger.kernel.org; keyrings@vger.kernel.org; Horia Geanta
> > <horia.geanta@nxp.com>; Silvano Di Ninno <silvano.dininno@nxp.com>;
> > agk@redhat.com; snitzer@redhat.com; dm-devel@redhat.com;
> > jmorris@namei.org; serge@hallyn.com
> > Subject: Re: [RFC PATCH 0/2] Create CAAM HW key in linux keyring
> > and use in
> > dmcrypt
> > 
> > Franck LENORMAND <franck.lenormand@nxp.com> wrote:
> > 
> > > The capacity to generate or load keys already available in the
> > > Linux
> > > key retention service does not allows to exploit CAAM
> > > capabilities
> > > hence we need to create a new key_type. The new key type
> > > "caam_tk"
> > 
> > allows to:
> > >  - Create a black key from random
> > >  - Create a black key from a red key
> > >  - Load a black blob to retrieve the black key
> > 
> > Is it possible that this could be done through an existing key
> > type, such as the
> > asymmetric, trusted or encrypted key typed?
> > 
> > David
> 
> Hello David,
> 
> I didn't know about asymmetric key type so I looked it up, from my
> observation, it would not be possible to use it for the caam_tk as
> we must perform operations on the data provided.
> The name " asymmetric " is also misleading for the use we would have.
> 
> The trusted and encrypted does not provides the necessary
> callbacks to do what we would need or require huge modifications.
> 
> I would like, for this series to focus on the change related to
> dm-crypt. In effect, it is currently not possible to pass a key
> from the asymmetric key type to it.

What you're performing are all bog standard key wrapping operations
which is why we're asking the question: do we have to expose any of
this to the user?  Can this whole thing not be encapsulated in such a
way that the kernel automatically selects the best key
escrow/accelerator technology on boot and uses it (if there are > 1
there would have to be an interface for the user to choose).  We make
all the accelerator device key formats distinguishable so the kernel
can figure out on load what is supposed to be handling them.  That way
the user never need worry about naming the actual key handler at all,
it would all be taken care of under the covers.

The one key type per escrow/accelerator has us all going ... "aren't
there hundreds of these on the market?"  which would seem to be a huge
usability explosion because a user will likely only have one, but they
have to figure out the type instructions for that one.  I really think
a better way is to have a more generic key type that's capable of
interfacing to the wrap/unwrap and crypto functions in such a way that
the end user doesn't have to know which they're using: most platforms
only have one thing installed, so you use that thing.

James


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


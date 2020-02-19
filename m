Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB0316489C
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 16:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582126199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j9py75RdPD5dCi8ARBQ8WXo76/hlpDj/2yvi/PSs+AY=;
	b=h/XulraOxqoVA2TOJ3Mn/3yrKsOGygQknfoNMftizPnZNZpILe5GQu38hZeYCRZcYSWfqh
	lgrYdtAePj8maa54SrffU0sttjTJR63605roB04BTgsTMVnfGL5CJxtRpUmaMeHJzeXPN/
	Ch4N9d7k+cQkYqOu2Xk0WF2p5G/gMNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-UYzw5m7QM5-Mv3jgZtWBrA-1; Wed, 19 Feb 2020 10:29:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A0CB107B7D9;
	Wed, 19 Feb 2020 15:29:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9893D5DEC0;
	Wed, 19 Feb 2020 15:29:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 163263F5CF;
	Wed, 19 Feb 2020 15:29:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JFTcrb013646 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 10:29:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 998968ECFC; Wed, 19 Feb 2020 15:29:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D01F28ECF3;
	Wed, 19 Feb 2020 15:29:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01JFTYUs013835; 
	Wed, 19 Feb 2020 09:29:34 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01JFTYqg013834;
	Wed, 19 Feb 2020 09:29:34 -0600
Date: Wed, 19 Feb 2020 09:29:33 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200219152933.GL30153@octiron.msp.redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
	<1582095273-10279-4-git-send-email-bmarzins@redhat.com>
	<f7fff14fca415c19b2a9309155df4bc6b95c59a9.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <f7fff14fca415c19b2a9309155df4bc6b95c59a9.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/5] libmultipath: change loading and
 resetting in directio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: UYzw5m7QM5-Mv3jgZtWBrA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 19, 2020 at 10:42:50AM +0100, Martin Wilck wrote:
> On Wed, 2020-02-19 at 00:54 -0600, Benjamin Marzinski wrote:
> > The directio checker previously made sure to always keep an aio_group
> > around after loading or resetting the checker. There is no need to do
> > this, and removing this code simplifies the checker.  With this
> > change,
> > there is no longer a need for a load or unload checker function, only
> > a
> > reset function which is run when the checker is reset or unloaded.
> > Changing this broke a number of tests, so the unit tests have been
> > updated as well.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/checkers.c          |  26 ++---
> >  libmultipath/checkers.h          |   2 +-
> >  libmultipath/checkers/directio.c |  43 +-------
> >  tests/directio.c                 | 177 +++++++++++++--------------
> > ----
> >  4 files changed, 81 insertions(+), 167 deletions(-)
> 
> Many thanks for making this change. I feared that the directio tests
> were tied quite closely to implementation details...

I've always been looking at the unit tests as a way to make sure that we
exercise code paths that are hard to hit with functional tests in a more
real-world environment. As such, the idea is to write them specifically
to match the code.

> 
> Reviewed-by: Martin Wilck <mwilck@suse.com>
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EC547B842
	for <lists+dm-devel@lfdr.de>; Tue, 21 Dec 2021 03:10:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640052634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TLeCYRKC6E4cDEbd7ovX6h3iXIV7CrlopkU9wtsZhkE=;
	b=h11bfBWO0v4RTTaYII+53ROFzou0OuwyYoWewDjHxjHLgO9/P0K1SHvB+CPk3VAk77qi5e
	xYmSkWkjir40vpBwVVkfcr9VE7iFU+90zMxlcRzJwNVdYgYN89bJrV6UYIUW4gbR3K0/+p
	12L/lSe5YIDtGOV0H9vpu98CPWHDbjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-Ef_0KbZrMguZRDe3q0DHMg-1; Mon, 20 Dec 2021 21:10:31 -0500
X-MC-Unique: Ef_0KbZrMguZRDe3q0DHMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81EDC100D680;
	Tue, 21 Dec 2021 02:10:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A5B07D57F;
	Tue, 21 Dec 2021 02:10:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6283F1809CB8;
	Tue, 21 Dec 2021 02:10:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BL29qQ4019270 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Dec 2021 21:09:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4363B78AA7; Tue, 21 Dec 2021 02:09:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 351FA78A8F;
	Tue, 21 Dec 2021 02:09:49 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1BL29kvk017922; 
	Mon, 20 Dec 2021 20:09:46 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1BL29j2l017921;
	Mon, 20 Dec 2021 20:09:45 -0600
Date: Mon, 20 Dec 2021 20:09:44 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211221020944.GA17665@octiron.msp.redhat.com>
References: <20211124232132.746480-1-muneendra.kumar@broadcom.com>
	<465ba608d807895d5697554d9cc21086493c0b8e.camel@suse.com>
	<bf4de4b36163c2dceb85df22241c1db310ccc8b9.camel@suse.com>
	<f7ab2f4c696a7e17806d08b796324ca53cefbb6f.camel@erwinvanlonden.net>
	<b8ca37a3cadcd877c92c8d9b970c17661c946380.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <b8ca37a3cadcd877c92c8d9b970c17661c946380.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "muneendra.kumar@broadcom.com" <muneendra.kumar@broadcom.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH] multipathd: handle fpin events
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 07, 2021 at 09:11:55AM +0000, Martin Wilck wrote:
> On Tue, 2021-12-07 at 09:19 +1000, Erwin van Londen wrote:
> 
> Moreover, the existing marginal paths handler has two different modes
> of operation, the "classical" one that disables reinstate, and the 
> more modern one that uses marginal pathgroups. I am wondering whether
> we need the first mode in the long run. In particular if we want to
> generalize this feature, we may want to get rind of the "classical"
> mode altogether. I'm not aware of any distinct advantages of that
> algorithm compared to marginal path groups.
> 
> @Ben, Muneendra, what do you think?

Sorry I missed this. I'm fine with deprecating the old style of handling
marginal paths.
 
> One word of caution here: we must be careful not to over-engineer.
> As long as no other mechanism like FPIN for other transports is
> conceivable, generalizing the concept makes only so much sense.
> Therefore we shouldn't hold back the FPIN patches until we have
> conceived of a generic mechanism, which may take a lot of time to
> develop. If another mechanism becomes available, we could still try to
> generalize the concept, if we keep the current additions clean and
> well-separated from the core multipathd code.
> 
> However I am really thrilled by the prospect of generalizing event
> handling and reusing the uevent threads for FPIN. That would reduce
> complexity a lot, which is a good thing IMO.
> 
> @Ben, Muneendra, again, your opinions?

I don't have a problem with that. Doing this does entwine a chunk of
code that may not get frequently used to a chunk of code that is
essential for multipathd to run correctly.  But I guess if there are
corner cases in the fpin code that cause issues for the rest of
multipath, then either the fpin code gets used a lot and they are found
quickly, or it doesn't, and they rarely cause problems. 

-Ben

> Best
> Martin
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


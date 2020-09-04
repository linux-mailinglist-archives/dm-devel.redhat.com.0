Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 91E8725E176
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 20:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599244003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vq2FpAVgmJzNnyc0HVYX85Ki+MZkyZ998K41TcgHujY=;
	b=C1WftJOsRsPIjj3ZlsinYD9IYQ+T3YV9wyz/A5famclsWmHG8LVWhe4Laow1rqrJEcFeJO
	MwlcFyKiL0Wi6xGN12GmQKpWft0gI1J/v8tJe2TaGCbXA51zcGmUhg/MF801U3XR6H/Q8a
	NZ8Cn2dZriKoXuPBmLwR0URPbHUO9bE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-obs1EhzZOr6yuUO_PxPhYQ-1; Fri, 04 Sep 2020 14:26:41 -0400
X-MC-Unique: obs1EhzZOr6yuUO_PxPhYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753DF18BA287;
	Fri,  4 Sep 2020 18:26:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEA3819C59;
	Fri,  4 Sep 2020 18:26:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4B7B972E6;
	Fri,  4 Sep 2020 18:26:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084IQ06B003839 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 14:26:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CD6F5C1D0; Fri,  4 Sep 2020 18:26:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E5A85C1DC;
	Fri,  4 Sep 2020 18:25:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 084IPuhl024518; 
	Fri, 4 Sep 2020 13:25:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 084IPtpA024517;
	Fri, 4 Sep 2020 13:25:55 -0500
Date: Fri, 4 Sep 2020 13:25:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200904182555.GA11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<5edc1c2b-eb21-198b-9880-3be6621496f9@huawei.com>
	<4a51a6797398562b475e3320220112c2cd0d2186.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <4a51a6797398562b475e3320220112c2cd0d2186.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 05/14] multipathd: use MALLOC and check
 return value in, cli_getprkey func
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 03, 2020 at 09:13:04PM +0200, Martin Wilck wrote:
> On Wed, 2020-09-02 at 15:18 +0800, lixiaokeng wrote:
> > In cli_getprkey func, we use MALLOC instead of malloc, and check
> > the return value of MALLOC.
> > 
> > Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> > Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> > Signed-off-by: Linfeilong <linfeilong@huawei.com>
> > ---
> >  multipathd/cli_handlers.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
> > index 27e4574f..d345afd3 100644
> > --- a/multipathd/cli_handlers.c
> > +++ b/multipathd/cli_handlers.c
> > @@ -1535,7 +1535,11 @@ cli_getprkey(void * v, char ** reply, int *
> > len, void * data)
> >  	if (!mpp)
> >  		return 1;
> > 
> > -	*reply = malloc(26);
> > +	*reply = MALLOC(26);
> > +	if (!*reply) {
> > +		condlog(0, "malloc *reply failed.");
> > +		return 1;
> > +	}
> 
> MALLOC is not necessary (*reply isn't left uninialized), nor is the
> error message.

What's you objection to the error message? Admittedly there is basically
no chance that malloc(26) would ever actually fail. But when things
fail, having error messages so that we can debug them faster is helpful.

If your objection is that malloc checks are mostly just there for good
form, and so those error messages won't actually help in practice, I
agree. But as a general rule, I think we should print error messages on
things that are unambiguoulsy errors.

-Ben

> 
> Regards,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


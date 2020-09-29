Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 52BB627D4F5
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 19:52:16 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601401935;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z/0HgJNs3cNooYDS9PtREjqG4HVw2jFHoEpWamTZ4tY=;
	b=Q7iXSb6ajMOIV4uHZk8Qh7+MM5ISA2NE+7IuKL1RRL1ljojvXvc6/BuCp1+V4VoLX3T94E
	cxewefH/AYRDBSuPRXJWRW7PNHCNizVQOyEdEIttfMGRRB72B53x5mk9LSF1JCunB1WUEh
	IE8hs4VwadEkiY/kgh2nx48zcE0O7Zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-gdxkZ5uuPwak7XQQM5JLDQ-1; Tue, 29 Sep 2020 13:52:12 -0400
X-MC-Unique: gdxkZ5uuPwak7XQQM5JLDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FD24803F5B;
	Tue, 29 Sep 2020 17:51:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C72B5C1C4;
	Tue, 29 Sep 2020 17:51:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF87B44A5B;
	Tue, 29 Sep 2020 17:51:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08THp8wb016116 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 13:51:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBD177367B; Tue, 29 Sep 2020 17:51:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A44181C58;
	Tue, 29 Sep 2020 17:50:58 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08THouYF031609; 
	Tue, 29 Sep 2020 12:50:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08THou6l031608;
	Tue, 29 Sep 2020 12:50:56 -0500
Date: Tue, 29 Sep 2020 12:50:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200929175055.GS3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-20-mwilck@suse.com>
	<20200928202624.GP3384@octiron.msp.redhat.com>
	<3ebea94ffd3be1a24c1f3a3159a337a7e878ce99.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <3ebea94ffd3be1a24c1f3a3159a337a7e878ce99.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 19/23] multipathd: move cleanup_{prio,
 checkers, foreign} to libmultipath_exit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 29, 2020 at 11:31:06AM +0200, Martin Wilck wrote:
> On Mon, 2020-09-28 at 15:26 -0500, Benjamin Marzinski wrote:
> > On Thu, Sep 24, 2020 at 03:40:50PM +0200, mwilck@suse.com wrote:
> > > 
> > >  /*
> > >   * We don't support re-initialization after
> > > @@ -65,6 +66,9 @@ int libmultipath_init(void)
> > >  static void _libmultipath_exit(void)
> > >  {
> > >  	libmultipath_exit_called = true;
> > > +	cleanup_foreign();
> > 
> > I don't really feel too strongly about this, but it seems to me that
> > there is a difference between the checkers and prioritizers, which
> > it seems like most users of libmultipath would want, and the foreign
> > code, which doesn't seem that way. libmpathpersist, for instance,
> > will use the checkers and prioritizers, but not the foreign code.
> > On the other hand, if the caller isn't using the foreign code,
> > then grabbing the lock and checking the foreign pointer shouldn't
> > take much time.
> 
> It would just be a few cycles. I want callers to have to worry about
> cleanup as little as possible. All else is error-prone IMO, and
> although I agree that the foreign functions are less important than
> checkers and prio, I thought it made sense to treat all our "plug-ins"
> the same way.
> 
> Ideally I'd like to do checker/prio/foreign initialization completely
> lazily too, in the sense that callers don't need to worry about calling
> init_checkers() etc., either. But this series had to stop at some
> point.
> 
> Either way, it's not a big issue, so please tell me if you feel
> strongly enough about it to ask me to revert the change.

I already ACKed this bug in my reply to:

[PATCH 00/23] libmultipath: improve cleanup on exit

https://www.redhat.com/archives/dm-devel/2020-September/msg00635.html

Sorry for the confusion.
-Ben
 
> Regards,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 91AB0279D40
	for <lists+dm-devel@lfdr.de>; Sun, 27 Sep 2020 03:04:37 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601168676;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FSr2ZxecIifPYJr/XrHJc/BuW1w3OMuqNcZZc/sVXy8=;
	b=g6iHRC0k7rkJl5D4Oc+/cpHkbhxtLyRZciG+2Vv8dqnKP2+36NXm+2P5LBE16uF7DvlO8B
	kmN5S4d7FXvPEI0lwG7SkDbH0rzLHz3LTqXo49F7zvhcke7oyZikAcMGrPlhoeEkla9iaw
	qZLoLAEJQYbLf3SNTkP16QcnZOtC4v8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-QZqE_VEuOQCARvWxPNLjUQ-1; Sat, 26 Sep 2020 21:04:34 -0400
X-MC-Unique: QZqE_VEuOQCARvWxPNLjUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 165311DDE0;
	Sun, 27 Sep 2020 01:04:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 380E05D9CA;
	Sun, 27 Sep 2020 01:04:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0AFA1832FC1;
	Sun, 27 Sep 2020 01:04:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08R13iun005993 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 26 Sep 2020 21:03:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBF3110016DA; Sun, 27 Sep 2020 01:03:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B15E910021AA;
	Sun, 27 Sep 2020 01:03:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08R13eTt012456; 
	Sat, 26 Sep 2020 20:03:40 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08R13dk3012455;
	Sat, 26 Sep 2020 20:03:39 -0500
Date: Sat, 26 Sep 2020 20:03:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200927010339.GK3384@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-14-mwilck@suse.com>
	<20200925043458.GO11108@octiron.msp.redhat.com>
	<e0637cd84ca36dbba00f8ff5b92ffcb8e81aa747.camel@suse.com>
	<20200925215739.GA3384@octiron.msp.redhat.com>
	<91ed445c926ecf1fae57b8b0d7478f6b3401460c.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <91ed445c926ecf1fae57b8b0d7478f6b3401460c.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 13/21] libmultipath: provide defaults for
 {get, put}_multipath_config
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 26, 2020 at 11:43:46AM +0200, Martin Wilck wrote:
> On Fri, 2020-09-25 at 16:57 -0500, Benjamin Marzinski wrote:
> > On Fri, Sep 25, 2020 at 10:00:10PM +0200, Martin Wilck wrote:
> > > 
> > > I suggest to track the verbosity independently in a different
> > > variable,
> > > and just set it from init_config() if it was actually set in the
> > > config file. Most of the time, we set it from the command line.
> > > This would have the additional benefit not to have to call
> > > get_multipath_config() in dlog().
> > 
> > Sure. That sounds like a much simpler solution than what I was
> > proposing.
> 
> I will do that in a separate patch. It will actually be a short
> series with logging fixes. Would you ack this patch then?
> In general it makes sense for get_multipath_config() to return NULL if
> the struct config is not initialized.
> 

Sure.
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>


> Thanks,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


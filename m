Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C19F52793D6
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 23:58:25 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601071104;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bscBj/I8AQfSSJsAZ+dDN/od/eryKCIRe068D9MxgaA=;
	b=T4X8dUnkq6aBXhuk2pS9xernVLi9W3GDJTZFmSOuLYK8LBq8Tp+bY2nPZ2i+ZVxyWXbNgL
	gzuzx3R8ZgudCfBQorqObiNCj8ikkdPKoc47IWQYz+tD+AuHVgrOYYlxE2qjDMd4oDLjlq
	kPHlyPigDoEXt++0IjC/bp5yq1Z2j+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-nF4eq6zvMh20HHcXBlNOKg-1; Fri, 25 Sep 2020 17:58:22 -0400
X-MC-Unique: nF4eq6zvMh20HHcXBlNOKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6623881F03E;
	Fri, 25 Sep 2020 21:58:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B41F73698;
	Fri, 25 Sep 2020 21:58:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 037AD1826D2B;
	Fri, 25 Sep 2020 21:57:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PLvjKB001299 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 17:57:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60B291001901; Fri, 25 Sep 2020 21:57:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BA8010013DB;
	Fri, 25 Sep 2020 21:57:42 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08PLvecE004351; 
	Fri, 25 Sep 2020 16:57:40 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08PLvdCC004350;
	Fri, 25 Sep 2020 16:57:39 -0500
Date: Fri, 25 Sep 2020 16:57:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200925215739.GA3384@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-14-mwilck@suse.com>
	<20200925043458.GO11108@octiron.msp.redhat.com>
	<e0637cd84ca36dbba00f8ff5b92ffcb8e81aa747.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <e0637cd84ca36dbba00f8ff5b92ffcb8e81aa747.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 25, 2020 at 10:00:10PM +0200, Martin Wilck wrote:
> On Thu, 2020-09-24 at 23:34 -0500, Benjamin Marzinski wrote:
> > 
> > This causes problems with the libmpathvalid library code I
> > wrote.  The
> > issue is that right now, when you run _init_config() if
> > get_multipath_config() returns NULL, you will use the default
> > loglevel.
> > I would like the library user to have control of the log level, even
> > during the calls to _init_config().
> 
> I see. So using init_config() actually had a benefit for you already
> over load_config() :-) Such control over the verbosity would actually
> be good for multipath-tools, too.
> 
> > One possiblity would be to make init_config() take verbosity as an
> > argument.  There would also need to be some other config variable
> > that
> > gets set at the start of init_config(), which is used by
> > libmp_get_multipath_config() to check if it is initialized.
> 
> I suggest to track the verbosity independently in a different variable,
> and just set it from init_config() if it was actually set in the
> config file. Most of the time, we set it from the command line.
> This would have the additional benefit not to have to call
> get_multipath_config() in dlog().

Sure. That sounds like a much simpler solution than what I was
proposing.

-Ben

> 
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


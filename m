Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 8B109196F79
	for <lists+dm-devel@lfdr.de>; Sun, 29 Mar 2020 20:52:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585507966;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f7gmOJsfc3VHkuf91n0gb1TUXnEoVllbywg3lzJi7oA=;
	b=QpcPrp5hS/53/ZA2YNJS6fNYoBHxEIYailwKcSdJYg+tq0nO0aL6EUYZYQnSmW+jIC4F51
	tHsCAv06+1rzLBG48MCPMNIGUZyzl9Km2guSQUhC9WOeKPlhwOC8yQBcQAb8yQ9d6rDYVv
	JkPP9jgZAZVAPTOB8eTyCi1c4qnV4BU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-reNOoDunMhOjHM5CH8FQRQ-1; Sun, 29 Mar 2020 14:52:44 -0400
X-MC-Unique: reNOoDunMhOjHM5CH8FQRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 090968010C1;
	Sun, 29 Mar 2020 18:52:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7A1353C27;
	Sun, 29 Mar 2020 18:52:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79B761803C38;
	Sun, 29 Mar 2020 18:52:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RL9Z6J022323 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 17:09:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DD652166B2B; Fri, 27 Mar 2020 21:09:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 695992166B2C
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 21:09:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C44FE185A78E
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 21:09:31 +0000 (UTC)
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-461-rZSkz8GlOfWkpEkutdnLMg-1; Fri, 27 Mar 2020 17:09:28 -0400
X-MC-Unique: rZSkz8GlOfWkpEkutdnLMg-1
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.84_2)
	(envelope-from <bdmc@mail.buadh-brath.com>)
	id 1jHwEJ-0005AZ-NY; Fri, 27 Mar 2020 21:09:27 +0000
Received: by buadh-brath.com (Postfix, from userid 1000)
	id B765020562; Fri, 27 Mar 2020 16:52:25 -0400 (EDT)
Date: Fri, 27 Mar 2020 16:52:25 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
To: dm-devel@redhat.com, linux-lvm@redhat.com
Message-ID: <20200327205225.GK7435@bdmcc-us.com>
References: <20200326233144.GM17504@agk-dp.fab.redhat.com>
	<20200327195006.GE6382@bdmcc-us.com>
	<20200327205329.GA29554@agk-dp.fab.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200327205329.GA29554@agk-dp.fab.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RL9Z6J022323
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 29 Mar 2020 14:51:25 -0400
Subject: Re: [dm-devel] [linux-lvm] storage-logger: Recording changes to the
 udev database
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Mar 27, 2020 at 08:53:29PM +0000, Alasdair G Kergon wrote:
> On Fri, Mar 27, 2020 at 03:50:06PM -0400, Brian McCullough wrote:
> > In your instructions, you say to put the "working" script in /usr/sbin,
> > while in the udev rule, it is in /sbin/
> 
> In Fedora they are the same.

Ah.  So they are aliases.



> > I tried adding and removing a USB-connected drive, but did not see any
> > response in the journal.  Should I have seen something, or are those not
> > seen?
> 
> You should test the script in isolation in case there are any other 
> differences on Debian.  Change the top line to '...bash -x' so you
> can watch it, set some environment variables (like ACTION=add) and 
> run it directly.


Thank you.  I will do so over the weekend, and report.


> Alasdair


Brian


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


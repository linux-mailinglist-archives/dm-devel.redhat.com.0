Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE32196F82
	for <lists+dm-devel@lfdr.de>; Sun, 29 Mar 2020 20:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585507984;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f13pzFKSqXn9kA+cKgCxyvyZPYX8YmjOy4qZkScquV0=;
	b=btgANnx+0uakJj9rQHULowOm6y1drR4Z06/31SRCYNf0fF0wuQpoHw+Usg+L8mmWpbm63h
	dZjv/i4j/wfx/p7KSj6PykYQSAOVxbTHh5tIwOBnc6nDw9hyWO7Z5nrBck0FdISvkPIeaM
	IEdS1HGC5fMohfmuuUY8c8Zr+Ppw/NE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-XFOML-A4OsWJQbMEsnqROg-1; Sun, 29 Mar 2020 14:52:15 -0400
X-MC-Unique: XFOML-A4OsWJQbMEsnqROg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E139E800D5F;
	Sun, 29 Mar 2020 18:52:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F7BE5C1B5;
	Sun, 29 Mar 2020 18:52:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A545B944BA;
	Sun, 29 Mar 2020 18:52:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02R1Sj9N018406 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 21:28:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C7C51004054; Fri, 27 Mar 2020 01:28:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53EB11007266
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 01:28:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9629F101A55A
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 01:28:42 +0000 (UTC)
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-198-3mXW4SJfNCG8x_nfcwV3SA-1; Thu, 26 Mar 2020 21:28:39 -0400
X-MC-Unique: 3mXW4SJfNCG8x_nfcwV3SA-1
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.84_2)
	(envelope-from <bdmc@mail.buadh-brath.com>)
	id 1jHdBd-0006MF-Ac; Fri, 27 Mar 2020 00:49:25 +0000
Received: by buadh-brath.com (Postfix, from userid 1000)
	id C098F203D3; Thu, 26 Mar 2020 20:32:24 -0400 (EDT)
Date: Thu, 26 Mar 2020 20:32:24 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
To: dm-devel@redhat.com, linux-lvm@redhat.com
Message-ID: <20200327003224.GB3078@bdmcc-us.com>
References: <20200326233144.GM17504@agk-dp.fab.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200326233144.GM17504@agk-dp.fab.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02R1Sj9N018406
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Mar 26, 2020 at 11:31:45PM +0000, Alasdair G Kergon wrote:
> I'm experimenting with ways of recording changes to the udev database so
> you can look back at the history of the storage stack on a particular
> machine.  This is still a work-in-progress, but it's reached a point
> where I'd like more people to try it out.
> 
> I've written a shell script that records data related to storage uevents
> in the system journal and a perl script that helps you to interrogate
> this data later to create a representation of the storage components.
> 
> If you're interested, please try this out and let me know if you think
> pursing this approach further would lead to something that you would
> use and distributions should ship.


Alasdair,

I have downloaded and installed in a Debian 9 environment.

There are a couple of differences that I have seen so far.

First, most importantly, the udev rules are in /etc/udev/rules.d.

Secondly, it appears that the journalctl command does not like the
output fields option.

I will install this on another machine that has a bit more device
activity, and comment later.


Brian


 
  
> Alasdair
> -- 
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


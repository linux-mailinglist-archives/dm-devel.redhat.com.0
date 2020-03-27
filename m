Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id ACB90196F74
	for <lists+dm-devel@lfdr.de>; Sun, 29 Mar 2020 20:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585507941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vFqq9zdW7qj/XzqKegEMdk+Y0uYGV9SPqWdPh38c1K8=;
	b=GsOYhCkU0wa9GjxxY7sHEbq9QL1BWv3yUx4vXugy2WY3/Z7tc9oIduYv+Ch3bfwYcPa7Uk
	G9wvH7Kd8PiY3RYQwafjgzlTL1jHc61QSEyy/fFj/YAzf4yT1Z+LD3+m93l9SfCuGRrSc+
	0Qc03tzB4O9EkaJOgnU9MkyYVr4yFKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-UrCJ5JMjOfeuZC6KyTz5Mg-1; Sun, 29 Mar 2020 14:52:18 -0400
X-MC-Unique: UrCJ5JMjOfeuZC6KyTz5Mg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3A79800D5B;
	Sun, 29 Mar 2020 18:52:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E5153C27;
	Sun, 29 Mar 2020 18:52:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C01BD944BA;
	Sun, 29 Mar 2020 18:52:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RK7F6A020394 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 16:07:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 372B1101784D; Fri, 27 Mar 2020 20:07:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32FB91017852
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 20:07:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DB0C101A55D
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 20:07:13 +0000 (UTC)
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-104-FW30FhgxMJeTY3or0Nb-Gw-1; Fri, 27 Mar 2020 16:07:10 -0400
X-MC-Unique: FW30FhgxMJeTY3or0Nb-Gw-1
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.84_2)
	(envelope-from <bdmc@mail.buadh-brath.com>)
	id 1jHvG0-0004kQ-Mi; Fri, 27 Mar 2020 20:07:08 +0000
Received: by buadh-brath.com (Postfix, from userid 1000)
	id A7B8620562; Fri, 27 Mar 2020 15:50:06 -0400 (EDT)
Date: Fri, 27 Mar 2020 15:50:06 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
To: dm-devel@redhat.com, linux-lvm@redhat.com
Message-ID: <20200327195006.GE6382@bdmcc-us.com>
References: <20200326233144.GM17504@agk-dp.fab.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200326233144.GM17504@agk-dp.fab.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RK7F6A020394
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

Quick note, Alasdair.

In your instructions, you say to put the "working" script in /usr/sbin,
while in the udev rule, it is in /sbin/



I tried adding and removing a USB-connected drive, but did not see any
response in the journal.  Should I have seen something, or are those not
seen?



Thanks,
Brian



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


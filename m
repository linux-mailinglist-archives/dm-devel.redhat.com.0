Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id E0E7A196016
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 21:55:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585342515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+1tPO2n5OgY0gJo0nbg/CFPDab92KZClOWgnrBFYqq4=;
	b=OtxcglhZc170/jGFPlzMnfC3yf2SbMUrRTk3PgWjCPw5XGCY7oGLM7Z1QpfXWXjrXpu4Q9
	SWVU8xNmKviuDiLlIDEB8ZsV6bH+mrnKQ/xhLjhkljyVu2cbFxWnCU/44xFLz16z2MPyiO
	q9qfWI0OfmvPnH/lYO55XBuZO7A2Oho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-C2a8wt8VO1SyJ9S6nqavDg-1; Fri, 27 Mar 2020 16:54:11 -0400
X-MC-Unique: C2a8wt8VO1SyJ9S6nqavDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B940D100726A;
	Fri, 27 Mar 2020 20:54:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98461100EBA4;
	Fri, 27 Mar 2020 20:54:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B84918A04F;
	Fri, 27 Mar 2020 20:53:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RKrb5V021900 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 16:53:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A0C619757; Fri, 27 Mar 2020 20:53:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80CE419C7F;
	Fri, 27 Mar 2020 20:53:31 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>)
	id 1jHvys-0007o3-3D; Fri, 27 Mar 2020 20:53:30 +0000
Date: Fri, 27 Mar 2020 20:53:29 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20200327205329.GA29554@agk-dp.fab.redhat.com>
Mail-Followup-To: Brian McCullough <bdmc@bdmcc-us.com>, dm-devel@redhat.com,
	linux-lvm@redhat.com
References: <20200326233144.GM17504@agk-dp.fab.redhat.com>
	<20200327195006.GE6382@bdmcc-us.com>
MIME-Version: 1.0
In-Reply-To: <20200327195006.GE6382@bdmcc-us.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Peninsular House, 30-36 Monument
	Street, 4th Floor, London, England, EC3R 8NB.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-lvm@redhat.com
Subject: Re: [dm-devel] [linux-lvm] storage-logger: Recording changes to the
	udev	database
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Mar 27, 2020 at 03:50:06PM -0400, Brian McCullough wrote:
> In your instructions, you say to put the "working" script in /usr/sbin,
> while in the udev rule, it is in /sbin/

In Fedora they are the same.

> I tried adding and removing a USB-connected drive, but did not see any
> response in the journal.  Should I have seen something, or are those not
> seen?

You should test the script in isolation in case there are any other 
differences on Debian.  Change the top line to '...bash -x' so you
can watch it, set some environment variables (like ACTION=add) and 
run it directly.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


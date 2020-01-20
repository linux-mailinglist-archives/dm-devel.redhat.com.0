Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CFAF11432DB
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jan 2020 21:22:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579551728;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aUCl8ZNAH2ta6wztyOP+qn4x6YcRl4RNElYrWiuUKe4=;
	b=irPUfMEg2MJaHLxhmgFc3dgB/uHVR/HVIt62tPHwj45cS4N2WEXRxXByMPyq8qONVDQjZY
	ZsrxbS9Uly8vKw2PxDHSGHY/u1TwLwkFU2MVlSpOWdpvLLXpNQQNBehStX5zU7ZUa/wwK6
	KBAgoR/Ddm7wleEvnQZhBsvryz+IMvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-pqGzYfRRNZuA0LQSr3CKvQ-1; Mon, 20 Jan 2020 15:22:06 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49496107ACC9;
	Mon, 20 Jan 2020 20:21:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9226B10027A3;
	Mon, 20 Jan 2020 20:21:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 819C418089CD;
	Mon, 20 Jan 2020 20:21:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KKKMSt007024 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 15:20:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 159E510D14F9; Mon, 20 Jan 2020 20:20:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1080410D14F2
	for <dm-devel@redhat.com>; Mon, 20 Jan 2020 20:20:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B809101A55E
	for <dm-devel@redhat.com>; Mon, 20 Jan 2020 20:20:18 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-28-A9QEeqx6OBGgsx1ganAwGA-1; Mon, 20 Jan 2020 15:20:16 -0500
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 0A38821807;
	Mon, 20 Jan 2020 15:20:15 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id 7E93FA5F27; Mon, 20 Jan 2020 15:20:14 -0500 (EST)
MIME-Version: 1.0
Message-ID: <24102.2942.443422.59933@quad.stoffel.home>
Date: Mon, 20 Jan 2020 15:20:14 -0500
From: "John Stoffel" <john@stoffel.org>
To: Benjamin Marzinski <bmarzins@redhat.com>
In-Reply-To: <20200120150745.GO30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-11-git-send-email-bmarzins@redhat.com>
	<24099.17365.933723.879139@quad.stoffel.home>
	<20200120150745.GO30153@octiron.msp.redhat.com>
X-MC-Unique: A9QEeqx6OBGgsx1ganAwGA-1
X-MC-Unique: pqGzYfRRNZuA0LQSr3CKvQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00KKKMSt007024
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	John Stoffel <john@stoffel.org>, Martin Wilck <Martin.Wilck@suse.com>
Subject: Re: [dm-devel] [PATCH 10/15] libmultipath: change how the checker
 async is set
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

>>>>> "Benjamin" == Benjamin Marzinski <bmarzins@redhat.com> writes:

Benjamin> On Sat, Jan 18, 2020 at 12:43:49PM -0500, John Stoffel wrote:
>> >>>>> "Benjamin" == Benjamin Marzinski <bmarzins@redhat.com> writes:
>> 
Benjamin> The way that the checkers async mode worked in multipathd didn't make
Benjamin> much sense. When multipathd starts up, all checker classes are in the
Benjamin> sync mode, and any pathinfo() calls on devices would run the checker in
Benjamin> sync mode. However, the First time a checker class was used in
Benjamin> checkerloop, it would set that checker class to async (assuming
Benjamin> force_sync wasn't set).  After that, no matter when a checker from that
Benjamin> class was called, it would always run in async mode.  Multipathd doesn't
Benjamin> need to run checkers in sync mode at all, so don't.
>> 
>> Sorry, I had a hard time parsing this description, especially the last
>> sentence.  Do you mean that checkers should default to async then,
>> instead of sync mode?  And from looking at the code, don't you mean
>> that you force sync mode?  I guess the question is whether checker
>> classes should default sync, or async.  And if they move to async,
>> should they stay there?
>> 

Benjamin> Sorry. I mean that right now multipathd runs the checkers from pathinfo(),
Benjamin> wait_for_pending_paths() and check_path(). When multipathd starts, all
Benjamin> checkers are in sync mode. The first time a checker is run from
Benjamin> check_path(), it is switched to async mode, and stays there for the rest
Benjamin> of the time multipathd is runing.

Benjamin> There is no need for multipathd to run checkers in sync mode at all, so
Benjamin> we shouldn't be doing so for these first checks.

Thanks, that makes the entire issue much more clear.  This raises the
question of why there is a sync mode at all then?  In any case, the
above makes the issue more understandable.

John


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


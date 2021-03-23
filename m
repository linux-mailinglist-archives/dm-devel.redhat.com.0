Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 22625346614
	for <lists+dm-devel@lfdr.de>; Tue, 23 Mar 2021 18:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616519762;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5dHXtuBQJ+fDJTVUucu21qz4g57OhBnKQWGHEQQ2uLw=;
	b=CGQTsvIaSCITteyUPzPPG8kqqI3WvzPm8Ih0Yjgk0RTL0k9mISQ5ksM97JXxIgRyC1vwIG
	PWoBcXYgAbS1o63SwppLtevRLGhccqVwdvxEohhAKABopy4SclCCl5LgyDLaVtm0skAkIn
	1y3QWH8q/e9nZErQllyDUiVTddcRH6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-hadUol_IOByzPlMt2bKp8A-1; Tue, 23 Mar 2021 13:15:59 -0400
X-MC-Unique: hadUol_IOByzPlMt2bKp8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17C101007467;
	Tue, 23 Mar 2021 17:15:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA75D610AF;
	Tue, 23 Mar 2021 17:15:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 211BD1809C83;
	Tue, 23 Mar 2021 17:15:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NHFmMt028075 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 13:15:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC2585FCB0; Tue, 23 Mar 2021 17:15:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A94C60240;
	Tue, 23 Mar 2021 17:15:39 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 12NHFcih015429; Tue, 23 Mar 2021 13:15:38 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 12NHFcPn015425; Tue, 23 Mar 2021 13:15:38 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 23 Mar 2021 13:15:38 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <9bad9e38-033a-24b8-5f21-83d6161e583b@gmail.com>
Message-ID: <alpine.LRH.2.02.2103231314340.15014@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2103231058220.2542@file01.intranet.prod.int.rdu2.redhat.com>
	<20210323151238.GA4898@redhat.com>
	<9bad9e38-033a-24b8-5f21-83d6161e583b@gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] dm-integrity - add the "reset_recalculate" flag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 23 Mar 2021, Milan Broz wrote:

> > Do you need to bump the number of feature args supported (from 17 to
> > 18)?

Goo point. I've sent version 2 of the patch.

> And also update target minor version.
> 
> I was just under the impression that we decided not to support such a 
> flag (because we cannot change tag size, so it is not usable in some 
> situations). But if it is so simple, why not.

I found out that it is not as hard as it seemed, so we can implement it.

> For the reference, it was discovered in this report 
> https://gitlab.com/cryptsetup/cryptsetup/-/issues/631
> 
> Milan

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


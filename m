Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EC7D44274BC
	for <lists+dm-devel@lfdr.de>; Sat,  9 Oct 2021 02:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633740162;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dKYi2E8qsSwd3cDkbk6KnrKuvpGCMCwFa3STol6pr4A=;
	b=ddERyZ49/D0qatU/mAgyddCxmvFjWUKfOhWOb7rq2v0+K9jawobtu/Qns7D/9TkEtgB7rE
	oWkzqm+73xW5ADujsFS3Iq4HcGFuheUeetV5NXVvQbm2SfOdHZlde+ecYPk0xLIvbXomla
	SfeLyEKa6uVmOcVgPM9PwNOqRNTzxH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-x6dZQjOiPKqgH9j4IJcj3w-1; Fri, 08 Oct 2021 20:42:38 -0400
X-MC-Unique: x6dZQjOiPKqgH9j4IJcj3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733B810066FE;
	Sat,  9 Oct 2021 00:42:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 130E15F4E3;
	Sat,  9 Oct 2021 00:42:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A469B1809C84;
	Sat,  9 Oct 2021 00:42:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1990fv8r015233 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Oct 2021 20:41:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0833310016FF; Sat,  9 Oct 2021 00:41:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
	(agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 712B110016FE;
	Sat,  9 Oct 2021 00:41:51 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 3883)
	id 5B63F424F088; Sat,  9 Oct 2021 01:41:44 +0100 (BST)
Date: Sat, 9 Oct 2021 01:41:44 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <20211009004144.GA4718@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>, DM-DEVEL ML <dm-devel@redhat.com>
References: <20211008150626.8894-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211008150626.8894-1-xose.vazquez@gmail.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Amberley Place, 107-111 Peascod Street,
	Windsor, Berkshire, SL4 1TE.
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: Re: [dm-devel] [PATCH] multipath-tools: dm-devel is a closed ml
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 08, 2021 at 05:06:26PM +0200, Xose Vazquez Perez wrote:
> Just for subscribers

Although we manually moderate non-subscribers so their messages
do get through, often a bit delayed.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


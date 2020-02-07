Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 129B515500F
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 02:43:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581039792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FLlh86GJZwhKe1mSFbkiU+pDqGdVoxO+8lXe13AL8Sc=;
	b=IlBGhkOi4yVIzAP3lttN+OV7uARzvLjKQlRv2CqT8jyaKdusFpkf8Ypf+vqOSI1/+W+dhm
	X7rwIJRtWw60efX+nJyYpz39ZRSjH7sNu5aYSLn/ILyrGEFg3tZSzL/wZZIaVbPnrvkvDh
	ptKZ73SyaN87JlPeZPKv3e7T2BPgnpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-qxhdRmGzMM6m6vQwx6Vyjg-1; Thu, 06 Feb 2020 20:43:09 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2080801E6C;
	Fri,  7 Feb 2020 01:42:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25C981001B05;
	Fri,  7 Feb 2020 01:42:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 246221809567;
	Fri,  7 Feb 2020 01:42:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0171gcOI016384 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 20:42:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F7B7790EB; Fri,  7 Feb 2020 01:42:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C71C790DF;
	Fri,  7 Feb 2020 01:42:31 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>)
	id 1izsf7-0006n7-6l; Fri, 07 Feb 2020 01:42:29 +0000
Date: Fri, 7 Feb 2020 01:42:29 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: John Dorminy <jdorminy@redhat.com>
Message-ID: <20200207014228.GC23327@agk-dp.fab.redhat.com>
Mail-Followup-To: John Dorminy <jdorminy@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>,
	device-mapper development <dm-devel@redhat.com>
References: <20200201005524.23405-1-jdorminy@redhat.com>
	<20200203165402.GA11874@redhat.com>
	<CAMeeMh82tS6TZCLzMwW7Kk+wdnMFW8WXrbe6-vLxaAvBzU1gBw@mail.gmail.com>
	<20200207012432.GA23327@agk-dp.fab.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200207012432.GA23327@agk-dp.fab.redhat.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Peninsular House, 30-36 Monument
	Street, 4th Floor, London, England, EC3R 8NB.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] dm: expose dm_copy_name_and_uuid()
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
X-MC-Unique: qxhdRmGzMM6m6vQwx6Vyjg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Feb 07, 2020 at 01:24:33AM +0000, Alasdair G Kergon wrote:
> In other words, NEVER report name/uuid without ALSO still reporting
> dm_device_name alongside it.

The reason we only log dm_device_name() is because it is the minimum 
necessary to uniquely identify the device and tie together all
the messages relating to it.

Adding name/uuid to every message would make log messages unduly long.
We could offer an in-kernel option to log all setting and changing
of device names and uuids in the dm core, though I might argue that that
would just be covering up inadaquate logging in the userspace tools
making the changes.

Storage-logger offers a compromise that records it all from the
generated uevents.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


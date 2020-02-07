Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 17C98155CEB
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 18:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581096896;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JV7L7pwXhc2qHiIexCGSA9DxXkFERJGpvaOkxlbMKlw=;
	b=bLDD46OizFvU/AxQerrADw8JPRcRmLmyXAK7M/Gkvwp6+xM3K4+1ES00Aaz6pLzdjMMLFj
	cdqBN+OfpqugR0mBJCLcXhowXCDFpQd3CB/ZmaC6alfJn2RuDYDbFuh4Tm6ledix7IdFn7
	K0QAQCWIzmq9yo1MqCBtIakM/OOxWJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-5Nqcj-_oPDC5MzOeoYowqQ-1; Fri, 07 Feb 2020 12:34:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD690DB2F;
	Fri,  7 Feb 2020 17:34:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E87858E9EA;
	Fri,  7 Feb 2020 17:34:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 216A0866B7;
	Fri,  7 Feb 2020 17:34:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017HXVwK012227 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 12:33:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 54CC810002B6; Fri,  7 Feb 2020 17:33:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1D2C1001B2C;
	Fri,  7 Feb 2020 17:33:26 +0000 (UTC)
Date: Fri, 7 Feb 2020 12:33:25 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: John Dorminy <jdorminy@redhat.com>
Message-ID: <20200207173325.GA24010@redhat.com>
References: <20200201005524.23405-1-jdorminy@redhat.com>
	<20200203165402.GA11874@redhat.com>
	<CAMeeMh82tS6TZCLzMwW7Kk+wdnMFW8WXrbe6-vLxaAvBzU1gBw@mail.gmail.com>
	<20200207012432.GA23327@agk-dp.fab.redhat.com>
	<20200207014228.GC23327@agk-dp.fab.redhat.com>
	<CAMeeMh_m2EZsN_W0EzwNz7HsLs75QwTDEVY6UT+4HQkqEX8n8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMeeMh_m2EZsN_W0EzwNz7HsLs75QwTDEVY6UT+4HQkqEX8n8Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5Nqcj-_oPDC5MzOeoYowqQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 06 2020 at 10:19pm -0500,
John Dorminy <jdorminy@redhat.com> wrote:

> I agree that adding uuid to all messages would be gross bloat, and a
> bad idea to apply everywhere.
> 
> I didn't actually realize that devices could be renamed with dmsetup.
> Thanks for pointing that out...

Also, device names can also be ridiculously long.  I really just don't
think logging the name instead of major:minor is a great idea... but I'm
open to target authors electing to log it _in addition to_
dm_device_name() -- but I wouldn't want to go as far as imposing that
constraint with code...

Or would I? ;)

Create dm_pretty_device_name() that logs: "major:minor (name)" ?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


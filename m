Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 388DE155005
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 02:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581038707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6pPdAIXtsECMLbb1DtvLZpWwV1dP6ZXvmCHf+d5ZVuI=;
	b=b7hrfbAmgfpdWOUskxiMRg5IMe0NsWdXY+dhe7wuCzMeXP2iWqvygQteOn2svAF+R7FqRC
	kDyMsTQO3bSg/+UbTnPvD8Q6LrvWvK9XCBRAIHIn5azJGMtVTnu8Sqw3RyqMFAGXn7VAlw
	zxLRNsDNt45GYTBRa7igamBFUVWfsAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-JATUl3_KOBueSp_52scFIg-1; Thu, 06 Feb 2020 20:25:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D80288010F6;
	Fri,  7 Feb 2020 01:24:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 670E581213;
	Fri,  7 Feb 2020 01:24:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FCBB866A2;
	Fri,  7 Feb 2020 01:24:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0171Ogdm015709 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 20:24:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 724F3857BF; Fri,  7 Feb 2020 01:24:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DA0E81213;
	Fri,  7 Feb 2020 01:24:34 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>)
	id 1izsNl-0006mk-80; Fri, 07 Feb 2020 01:24:33 +0000
Date: Fri, 7 Feb 2020 01:24:33 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: John Dorminy <jdorminy@redhat.com>
Message-ID: <20200207012432.GA23327@agk-dp.fab.redhat.com>
Mail-Followup-To: John Dorminy <jdorminy@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>,
	device-mapper development <dm-devel@redhat.com>
References: <20200201005524.23405-1-jdorminy@redhat.com>
	<20200203165402.GA11874@redhat.com>
	<CAMeeMh82tS6TZCLzMwW7Kk+wdnMFW8WXrbe6-vLxaAvBzU1gBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMeeMh82tS6TZCLzMwW7Kk+wdnMFW8WXrbe6-vLxaAvBzU1gBw@mail.gmail.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Peninsular House, 30-36 Monument
	Street, 4th Floor, London, England, EC3R 8NB.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: JATUl3_KOBueSp_52scFIg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 06, 2020 at 07:28:04PM -0500, John Dorminy wrote:
> To be clear, I care more about getting the name in kernelspace than
> about getting the UUID in kernelspace. (253:0) is a unique name for

>From the kernel's point of view, it is THE unique and definitive name
for the lifetime of the device.  It's the one thing userspace can rely
upon (without assuming additional 'good' userspace behaviour) to tie
together messages relating to the same device instance.

> test-test, and we can get that via dm_device_name() at the moment. But
> test-test is often a better name -- it's the name the user provided

It can be changed and so processing can't rely on it without trusting
both the userspace management code's self-imposed constraints and the
sysadmin not to have worked around them.

In other words, NEVER report name/uuid without ALSO still reporting
dm_device_name alongside it.

Also take a look at
  https://github.com/lvmteam/storage-logger
which tackles logging all the relevant device information.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


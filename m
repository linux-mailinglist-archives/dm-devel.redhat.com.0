Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4B21C9F7F
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 02:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588897149;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0ujkGd+kgsLjhe52ao1vFskCSx40eNP4doCrhZ1nTAU=;
	b=XAG2UF6K80Uqe8KSiOh7uZKuW7q45AemQJYqRqMEbIMsPpeWa1mt4epdXAT0TS1/aiFgRf
	uZSVuhKzTIySGlhaDwl8ppAqtXNg8pO/VouTEIF1odRYQPhJZIRwlGCfwUbLjJNkAp2aDK
	xJ0EuZx1iAxo6R0/TKekZ0XhKVustxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-5VqxDk1qNoGXMDDiLNrnXA-1; Thu, 07 May 2020 20:19:06 -0400
X-MC-Unique: 5VqxDk1qNoGXMDDiLNrnXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40F6080058A;
	Fri,  8 May 2020 00:19:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86CFC5D9C5;
	Fri,  8 May 2020 00:18:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9DEA4CAA0;
	Fri,  8 May 2020 00:18:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0480IX6O002683 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 20:18:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87CDD5D9CC; Fri,  8 May 2020 00:18:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF7325D9C5;
	Fri,  8 May 2020 00:18:27 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>)
	id 1jWqif-0006ez-R6; Fri, 08 May 2020 01:18:26 +0100
Date: Fri, 8 May 2020 01:18:25 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: Kjetil Orbekk <kj@orbekk.com>
Message-ID: <20200508001825.GC22266@agk-dp.fab.redhat.com>
Mail-Followup-To: Kjetil Orbekk <kj@orbekk.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	harshads@google.com, Khazhismel Kumykov <khazhy@google.com>
References: <20200507230532.5733-1-kj@orbekk.com>
MIME-Version: 1.0
In-Reply-To: <20200507230532.5733-1-kj@orbekk.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Peninsular House, 30-36 Monument
	Street, 4th Floor, London, England, EC3R 8NB.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, harshads@google.com,
	Khazhismel Kumykov <khazhy@google.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm: track io errors per mapped device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, May 07, 2020 at 07:05:33PM -0400, Kjetil Orbekk wrote:
> This will track ioerr_cnt on all dm targets and expose it as
> <device>/dm/ioerr_cnt.

How do you propose to use this?
What are you trying to measure and why?
- How exact must the number be to meet your requirements?

Or to put it another way, do you need to know the exact number you are
exposing, or do you derive something else from this which could also be
derived from an alternative number?

In particular, given the way we split and clone and stack devices (so
there may be an element of multiplication), and reload tables (so
existing values might become irrelevant), did you consider alternative
semantics before selecting this approach?
(Or to put it another way, is there a need to reset it or track
the value since the last resume?)

(Documentation is also needed - which ought to explain the semantics
and how the observed values interact with the use of device-mapper
features.)

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


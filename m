Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A2AB31F2066
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jun 2020 22:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591646526;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=11LlGCa1ezEuF1GBxpq/eUt9laFym2LstP641FDfqHM=;
	b=esXoDpPkzjhfHWF6Q0V55E00XIXtIB8/d14l6HvQWNJJ1ZlDY0ndwRK2EN+KtgGC/FHzY1
	0FO5OyRaJCgH98MpajgA/ruHzxkWs784sWgK8SNDBwGNBFJ3QqNElXB3gYecgne36fcvX6
	fDKrLn+C+zPGgjy0lIlt29mrr54efyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-Uwgg-uzHO9ODhX5pP0QA6Q-1; Mon, 08 Jun 2020 16:02:04 -0400
X-MC-Unique: Uwgg-uzHO9ODhX5pP0QA6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 559041940926;
	Mon,  8 Jun 2020 20:01:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C08D55C296;
	Mon,  8 Jun 2020 20:01:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92F9D1809547;
	Mon,  8 Jun 2020 20:01:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058K1RGV009503 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 16:01:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1BE02A9FDC; Mon,  8 Jun 2020 20:01:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17E078A4C4
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 20:01:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE50C833B50
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 20:01:24 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-33--bTV6k5GOlmRaeV11DtKxg-1;
	Mon, 08 Jun 2020 16:00:46 -0400
X-MC-Unique: -bTV6k5GOlmRaeV11DtKxg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 30BB6AEB6;
	Mon,  8 Jun 2020 20:00:48 +0000 (UTC)
Message-ID: <ec43e02e4e38cd7570e93784768e3425062a7e0d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Date: Mon, 08 Jun 2020 22:00:42 +0200
In-Reply-To: <20200508193302.11401-1-mwilck@suse.com>
References: <20200508193302.11401-1-mwilck@suse.com>
User-Agent: Evolution 3.36.2
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: "George, Martin" <Martin.George@netapp.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] multipath-tools: disable foreign
 libraries by default
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

Hi Ben,

On Fri, 2020-05-08 at 21:33 +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe,
> 
> This is a follow-up to the previous discussion with topic 'RFC:
> multipath-tools: NVMe native multipath and default setting for
> "enable_foreign"'. Upon Netapp's initiative, I'd asked for foreign
> libraries to be disabled by default. Ben had replied he'd agree,
> and suggested implementing a "-e" option for multipath to enable
> all foreign libraries:
> 
> https://www.redhat.com/archives/dm-devel/2020-February/msg00271.html
> 
> This patch set implements this idea.
> 
> Regards,
> Martin
> 
> 
> Martin Wilck (2):
>   libmultipath: set "enable_foreign" to NONE by default
>   multipath: add "-e" option to enable foreign libraries
> 
>  libmultipath/defaults.h    |  4 ++--
>  multipath/main.c           | 11 ++++++++++-
>  multipath/multipath.8      |  6 ++++++
>  multipath/multipath.conf.5 |  5 +++--
>  4 files changed, 21 insertions(+), 5 deletions(-)
> 

this series got no reply from you. Did you miss the post, perhaps?

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


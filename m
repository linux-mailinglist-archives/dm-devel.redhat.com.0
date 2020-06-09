Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C4AAC1F47A7
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jun 2020 22:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591732891;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bo3GDX1WQQQ9CqU5nlmDt5+nZ5zMXco/FhcMd81b1IE=;
	b=ZUMqFfSUwQrGDoS159xZU40e2zj9m5vlfQXwu3u6GuAYIDy3493mvHDr7RKbOgo9a1N3Bj
	bRF8pd3ohMmEnZlffQjYWlwIzmFR4IbtliNSIX+pbnSk5SQbuleyV84kb//vU6K8hsu8Ot
	NRSTBSkh+LSWeFFWds/hmFZbgsq7X2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-82iqhH0KOQ6H59--C36EFA-1; Tue, 09 Jun 2020 16:01:29 -0400
X-MC-Unique: 82iqhH0KOQ6H59--C36EFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D04941940925;
	Tue,  9 Jun 2020 20:01:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FFFD5C48E;
	Tue,  9 Jun 2020 20:01:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCC14B34A1;
	Tue,  9 Jun 2020 20:01:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059K0mC8019319 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 16:00:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6588760C87; Tue,  9 Jun 2020 20:00:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A7C660C84;
	Tue,  9 Jun 2020 20:00:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 059K0h2M026115; 
	Tue, 9 Jun 2020 15:00:43 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 059K0gCe026114;
	Tue, 9 Jun 2020 15:00:42 -0500
Date: Tue, 9 Jun 2020 15:00:42 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200609200042.GD5894@octiron.msp.redhat.com>
References: <20200508193302.11401-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200508193302.11401-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, "George, Martin" <Martin.George@netapp.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, May 08, 2020 at 09:33:00PM +0200, mwilck@suse.com wrote:
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

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

For the set.

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
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


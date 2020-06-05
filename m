Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 63A901F03E9
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403076;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fPFk7r8uhjzc9DyubHIeJsBRmMWPIDyfxyAe846e+GU=;
	b=hI9FXxxWQm7c4SD6JgEkNKCcVkolcGto84Gvi5fFKGpM0GOCeT3YKp5HIxBMQeOHefUY0k
	1KVawWxQZcbQ2AoFkeJf0Di8++lF0iAM8EuBTsSLvUbWsnC8wTuVJoxBKJjkfLcC/hz/7v
	5mZHtBqEvHWg/JM1v5sbmOB7jOOcqC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-rTthee8ePIOgymaftMFnUA-1; Fri, 05 Jun 2020 20:24:34 -0400
X-MC-Unique: rTthee8ePIOgymaftMFnUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB5C684638F;
	Sat,  6 Jun 2020 00:24:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A6497F4EB;
	Sat,  6 Jun 2020 00:24:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A8F91820EC9;
	Sat,  6 Jun 2020 00:24:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055JVNOV002481 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 15:31:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1434D10F2703; Fri,  5 Jun 2020 19:31:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBAD710F26FF
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 19:31:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F9EB811E77
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 19:31:15 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-193-XHOAGVRrNxqQYDckZkYBoA-1;
	Fri, 05 Jun 2020 15:31:10 -0400
X-MC-Unique: XHOAGVRrNxqQYDckZkYBoA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BFDC9AD85;
	Fri,  5 Jun 2020 19:31:12 +0000 (UTC)
Message-ID: <ee3a2cc648cf1f52aefbe61c6ea27bf618973f99.camel@suse.com>
From: Martin Wilck <martin.wilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
In-Reply-To: <1591312806-25110-1-git-send-email-bmarzins@redhat.com>
References: <1591312806-25110-1-git-send-email-bmarzins@redhat.com>
MIME-Version: 1.0
Date: Fri, 05 Jun 2020 21:30:59 +0200
User-Agent: Evolution 3.36.2
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: fix condlog NULL argument in
 uevent_get_env_var
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

On Thu, 2020-06-04 at 18:20 -0500, Benjamin Marzinski wrote:
> uevent_get_env_var() could call condlog with p == NULL. On gcc 10,
> this triggers warnings like:
> 
> In file included from uevent.c:47:
> In function 'uevent_get_env_var',
>     inlined from 'uevent_get_wwid' at uevent.c:170:8:
> debug.h:13:2: error: '%s' directive argument is null
> [-Werror=format-overflow=]
>    13 |  dlog(logsink, prio, fmt "\n", ##args)
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> uevent.c:132:2: note: in expansion of macro 'condlog'
>   132 |  condlog(4, "%s: %s -> '%s'", __func__, attr, p);
>       |  ^~~~~~~
> uevent.c: In function 'uevent_get_wwid':
> uevent.c:132:25: note: format string is defined here
>   132 |  condlog(4, "%s: %s -> '%s'", __func__, attr, p);
>       |                         ^~
> 
> If p is NULL, use "(null)" instead.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/uevent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


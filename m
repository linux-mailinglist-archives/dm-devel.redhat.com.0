Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C719D1DC373
	for <lists+dm-devel@lfdr.de>; Thu, 21 May 2020 02:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590020167;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ED4fBYXg6qT4wJfiKFGXibtcmbL5TjW2WpaJiAWcevI=;
	b=FPnliJyLblEx3f/CBxi9e0NutSjJv5Osg2mCoa++O9feWa5PTrhQzjUdEjCkFoTQLnIal5
	q432V5y6AKExQ+5FVCz5s0jfC0Mz5sJCv3r/kcFJDF8ybeMVSPpl3AuG0yaFTQUP9muk+y
	MEPPfsvCGENDGTa9UF7yLoXVDhVDmY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-skk8vpjbNfiW_x_T18XGhA-1; Wed, 20 May 2020 20:16:03 -0400
X-MC-Unique: skk8vpjbNfiW_x_T18XGhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112C28015CF;
	Thu, 21 May 2020 00:15:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 046685C1D0;
	Thu, 21 May 2020 00:15:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEB891809541;
	Thu, 21 May 2020 00:15:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04L0FNRI013627 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 20:15:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4AB32156A3B; Thu, 21 May 2020 00:15:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D2B2156A2E
	for <dm-devel@redhat.com>; Thu, 21 May 2020 00:15:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 028298ECB06
	for <dm-devel@redhat.com>; Thu, 21 May 2020 00:15:21 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-227-kue1sXjiPs2u5IvG8UzNug-1; Wed, 20 May 2020 20:15:15 -0400
X-MC-Unique: kue1sXjiPs2u5IvG8UzNug-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id A4FDB2A2AFE
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Organization: Collabora
References: <20200511163910.3778467-1-krisman@collabora.com>
	<ee987451-6d17-b978-809e-e0fe56dc13ce@gmail.com>
Date: Wed, 20 May 2020 20:15:09 -0400
In-Reply-To: <ee987451-6d17-b978-809e-e0fe56dc13ce@gmail.com> (Xose Vazquez
	Perez's message of "Thu, 21 May 2020 01:26:27 +0200")
Message-ID: <85tv0am9de.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: breeves@redhat.com, snitzer@redhat.com, linux-kernel@vger.kernel.org,
	khazhy@google.com, song@kernel.org, dm-devel@redhat.com,
	mpatocka@redhat.com, kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v4 0/2] Historical Service Time Path Selector
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

Xose Vazquez Perez <xose.vazquez@gmail.com> writes:

> On 5/11/20 6:39 PM, Gabriel Krisman Bertazi wrote:
>
>> This fourth version of HST applies the suggestion from Mikulas Patocka
>> to do the ktime_get_ns inside the mpath map_bio instead of generic
>> device-mapper code. This means that struct dm_mpath_io gained another
>> 64bit field.  For the request-based case, we continue to use the block
>> layer start time information.
>
> You should add some info to the multipath.conf.5 man page (
> https://git.opensvc.com/gitweb.cgi?p=multipath-tools/.git;a=blob;f=multipath/multipath.conf.5;h=05a5e8ffeb110d969f3b2381eb3b88d7f28380f6;hb=HEAD#l189
> ),
> or none one is going to use it.

Sure, will do.

-- 
Gabriel Krisman Bertazi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


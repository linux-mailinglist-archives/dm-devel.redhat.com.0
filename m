Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5212D6400A8
	for <lists+dm-devel@lfdr.de>; Fri,  2 Dec 2022 07:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669963888;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F/fAQor7A/AKHK4kgxyNatWva+w348EUaLV9nEJp68g=;
	b=D4o1XhwxEIWkl2S0e2k6lMp87w7BLDXN1UKAdfAfH4njd0RK0mwcBWdEdDOlYvMPK06GYQ
	9FF9oRozaGye0q/LLTsUQoXK+jSdHuC9nJhv6RpGL15jkYZKrj9bDexxz64wc3pozAIYU9
	Ha/9548HPVlJKwgMUuFUph8luVR30Qc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-Bigfc2Z2OcKcG6PSLw1Zxg-1; Fri, 02 Dec 2022 01:51:25 -0500
X-MC-Unique: Bigfc2Z2OcKcG6PSLw1Zxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F6F029324A5;
	Fri,  2 Dec 2022 06:51:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F3CD2166BB6;
	Fri,  2 Dec 2022 06:51:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D767B1946A44;
	Fri,  2 Dec 2022 06:51:18 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B92F719465A0
 for <dm-devel@listman.corp.redhat.com>; Fri,  2 Dec 2022 06:51:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9BB022166BBA; Fri,  2 Dec 2022 06:51:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94C712166BB6
 for <dm-devel@redhat.com>; Fri,  2 Dec 2022 06:51:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AB00101A52A
 for <dm-devel@redhat.com>; Fri,  2 Dec 2022 06:51:17 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-BwypiQ5uOdu1Y5a5xB1EQA-1; Fri, 02 Dec 2022 01:51:13 -0500
X-MC-Unique: BwypiQ5uOdu1Y5a5xB1EQA-1
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 83236100002;
 Fri,  2 Dec 2022 06:51:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p0zt7-007WkC-Ei; Fri, 02 Dec 2022 07:51:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Mike Snitzer <snitzer@redhat.com>
References: <20221116061656.2345538-1-peter@korsgaard.com>
 <877czkhc7u.fsf@dell.be.48ers.dk> <Y4fiQvg9OOATD5Cv@redhat.com>
 <87bkond1mi.fsf@dell.be.48ers.dk> <Y4jSkNJzTtRZSbrg@redhat.com>
 <871qpjcc50.fsf@dell.be.48ers.dk> <Y4me5YOfuXPC/ln5@redhat.com>
Date: Fri, 02 Dec 2022 07:51:09 +0100
In-Reply-To: <Y4me5YOfuXPC/ln5@redhat.com> (Mike Snitzer's message of "Fri, 2
 Dec 2022 01:44:53 -0500")
Message-ID: <87mt869u3m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH v2] dm init: add dm-mod.waitfor to wait for
 asynchronously probed block devices
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jonathan Corbet <corbet@lwn.net>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, fabio.aiuto@amarulasolutions.com,
 Helen Koike <helen.koike@collabora.com>, michael@amarulasolutions.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Mike" == Mike Snitzer <snitzer@redhat.com> writes:

Hi,

 > OK, I'll accept your patch, but will tweak the DMINFO slightly to look
 > more like rootwait's pr_info (e.g. "Waiting for device %s..." and such).

 > I'll also change the msleep(20) to msleep(5) like was introduced with
 > commit 39a0e975c37de ("init: reduce rootwait polling interval time to
 > 5ms") -- checkpatch be damned. ;)

Cool, thanks!

-- 
Bye, Peter Korsgaard

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


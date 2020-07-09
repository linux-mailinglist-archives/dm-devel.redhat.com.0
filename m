Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2523C219EEB
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 13:12:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-zKNIOI6iP9OneBMSY0jJKw-1; Thu, 09 Jul 2020 07:12:08 -0400
X-MC-Unique: zKNIOI6iP9OneBMSY0jJKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4451B186A8DC;
	Thu,  9 Jul 2020 11:12:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA3B15D9DD;
	Thu,  9 Jul 2020 11:12:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96CD21809547;
	Thu,  9 Jul 2020 11:11:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069BBqU2002705 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 07:11:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E912D1004C57; Thu,  9 Jul 2020 11:11:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E47E9100405E
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:11:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D70CF856A57
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:11:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-385-cL2cjz1HOtOGx18Aqu_yUQ-1;
	Thu, 09 Jul 2020 07:11:44 -0400
X-MC-Unique: cL2cjz1HOtOGx18Aqu_yUQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 16DF6AF0C;
	Thu,  9 Jul 2020 11:11:43 +0000 (UTC)
Message-ID: <a97d6321b166ca15a25edf0f4d2ab18fc418daed.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Chongyun Wu <wu.chongyun@h3c.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Date: Thu, 09 Jul 2020 13:11:40 +0200
In-Reply-To: <27245ecfc8be4229b52f736062585230@h3c.com>
References: <27245ecfc8be4229b52f736062585230@h3c.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Guozhonghua <guozhonghua@h3c.com>, Chengchiwen <chengchiwen@h3c.com>,
	Wangyong <wang.yongD@h3c.com>, Changlimin <changlimin@h3c.com>,
	Zhangguanghui <zhang.guanghui@h3c.com>
Subject: Re: [dm-devel] [PATCH]libmultipath/dmparser: add missing path with
 good status when sync state with dm kernel
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Chongyun,

On Wed, 2020-07-08 at 01:47 +0000, Chongyun Wu wrote:
> Hello Martin,
> Thanks for your reply. 
> Waiting for your patches I'd like to test it.  And also, I'd like to
> tell more detail about this issue.

Please check out the series I just posted. Part V is what matters for
your use case. I planned to CC you on that part but forgot, sorry.

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


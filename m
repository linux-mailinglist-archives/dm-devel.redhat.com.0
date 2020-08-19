Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4E143249FF4
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 15:30:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-ksrVEPjPNvyHlbP7_KCcZg-1; Wed, 19 Aug 2020 09:30:47 -0400
X-MC-Unique: ksrVEPjPNvyHlbP7_KCcZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFD438030A7;
	Wed, 19 Aug 2020 13:30:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 816B127BCD;
	Wed, 19 Aug 2020 13:30:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4C2E1832FC2;
	Wed, 19 Aug 2020 13:30:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JDUT0K022138 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 09:30:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52624D0161; Wed, 19 Aug 2020 13:30:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E780D0180
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:30:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81775811E81
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:30:26 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-118-4IeT2XQ1MUGH9DsTOTtBWg-1;
	Wed, 19 Aug 2020 09:30:24 -0400
X-MC-Unique: 4IeT2XQ1MUGH9DsTOTtBWg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6B029ACC6;
	Wed, 19 Aug 2020 13:30:49 +0000 (UTC)
Message-ID: <b15c04a46217267e9a929d82f9a0c8b45aae1cd5.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Date: Wed, 19 Aug 2020 15:30:22 +0200
In-Reply-To: <20200819131747.13400-1-mwilck@suse.com>
References: <20200819131747.13400-1-mwilck@suse.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 00/80] multipath-tools series part VI:
 incomplete udev initialization
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-19 at 15:17 +0200, mwilck@suse.com wrote:
> 
> Changes v2 -> v3, as suggested by Ben Marzinski:
> 
>  * 76/80 "libmultipath: select_action(): force udev reload for
> uninitialized
>    maps"
>    - moved configure.c changes from 77/80 to this patch, where it
> belongs
>  * 77/80 "libmultipath: log dm_task_run() errors"
>    - moved some hunks to 76/80, see above

Note that these patches carry an Reviewed-by: from Ben from v1 already.

Except for Ben's suggestion to force reload only if active paths are
available, the hunks have indeed only been moved between the two
patches. This is necessary because otherwise 76/80 won't compile.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


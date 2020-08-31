Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EB1EA258982
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 09:45:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-oXZlHo2xOo6-AFtpldePYg-1; Tue, 01 Sep 2020 03:44:11 -0400
X-MC-Unique: oXZlHo2xOo6-AFtpldePYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD53210ABDAE;
	Tue,  1 Sep 2020 07:44:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8975C2634D;
	Tue,  1 Sep 2020 07:44:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49F7F79A33;
	Tue,  1 Sep 2020 07:44:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VEbBPQ001326 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 10:37:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1ACF2166BB3; Mon, 31 Aug 2020 14:37:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC6512166BA0
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 14:37:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B56AD811E7F
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 14:37:05 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-48-fJ1gddiaNRm1zFUT0ubPEw-1;
	Mon, 31 Aug 2020 10:37:01 -0400
X-MC-Unique: fJ1gddiaNRm1zFUT0ubPEw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 717F1B1E2;
	Mon, 31 Aug 2020 14:36:59 +0000 (UTC)
Message-ID: <bfd637399397e33f01b5cdb9b7f8f9eaaa698103.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Date: Mon, 31 Aug 2020 16:36:58 +0200
In-Reply-To: <76528c71-f8b9-1595-edc1-e9061858a76f@huawei.com>
References: <50b2333d-8c5d-8705-a31a-11bb84980373@huawei.com>
	<76528c71-f8b9-1595-edc1-e9061858a76f@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 01 Sep 2020 03:43:47 -0400
Cc: lixiaokeng <lixiaokeng@huawei.com>, yanxiaodan@huawei.com,
	linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com,
	zkabelac@redhat.com
Subject: Re: [dm-devel] [PATCH V4 2/5] multipathd: use daemon_status_msg to
 construct sd notify msg in do_sd_notify func
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-31 at 19:37 +0800, Zhiqiang Liu wrote:
> sd_notify_status() is very similar with daemon_status(), except
> DAEMON_IDLE and DAEMON_RUNNING state. As suggested by Martin,
> we can create the sd notification string in a dynamic buffer,
> and treat DAEMON_IDLE and DAEMON_RUNNING cases first. Then,
> we can use daemon_status_msg[state] for other cases.
> 
> V3->V4:
> - put "STATUS=" in format string to avoid "prefix" var as suggested
> by
> Martin.
> 
> V2->V3:
> - set MSG_SIZE to 32 and use safe_sprintf as suggested by Martin.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  multipathd/main.c | 33 +++++++++++----------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 

Thank you.
Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


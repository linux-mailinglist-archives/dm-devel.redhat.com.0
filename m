Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D56201999FC
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 17:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585669318;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TYsy0dX015oF9c8KtWzxoBYtS00R2b3d6IkY3tZFUmY=;
	b=izMIhNPmK+8VbmV5EUxgQzr7LQy69pPlsoBknoVu8GJlIt55rVEkOrzwhy0joxH5vY6MZz
	68pTF3PiWpmGwo3TWRW5VDbXpucfeYRlEIGKX1hHKBBlmCClfHmsRTckjaAN1HHaL/UZzU
	b0zdHZkql5JDO6XSCbzBhKCmr75ekow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-ximFuiGsME2U1Le0FQst0w-1; Tue, 31 Mar 2020 11:41:56 -0400
X-MC-Unique: ximFuiGsME2U1Le0FQst0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABC2E18C8C00;
	Tue, 31 Mar 2020 15:41:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBD375C1C5;
	Tue, 31 Mar 2020 15:41:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A40C786C00;
	Tue, 31 Mar 2020 15:41:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VFfh1G019652 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 11:41:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E58962166B33; Tue, 31 Mar 2020 15:41:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E18522166B31
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 15:41:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3157B8FF66A
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 15:41:40 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-460-Yth75hEfN9Gq_Z0h6XfruQ-1;
	Tue, 31 Mar 2020 11:41:37 -0400
X-MC-Unique: Yth75hEfN9Gq_Z0h6XfruQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 66660B167;
	Tue, 31 Mar 2020 15:41:35 +0000 (UTC)
Message-ID: <8e889701ba1a0b238fcedaf874f0246800e21623.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Tue, 31 Mar 2020 17:41:34 +0200
In-Reply-To: <1585620055-27112-2-git-send-email-bmarzins@redhat.com>
References: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
	<1585620055-27112-2-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02VFfh1G019652
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC Patch 1/3] libmultipath: make libmp_dm_init
	optional
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

On Mon, 2020-03-30 at 21:00 -0500, Benjamin Marzinski wrote:
> Move dm_initialized out of libmp_dm_task_create(), and add
> a function skip_libmp_dm_init() so that users of libmultipath can
> skip
> initializing device-mapper. This is needed for other programs that
> use libmultipath (or a library that depends on it) but want to
> control
> how device-mapper is set up.
> 
> Also make dm_prereq a global function.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


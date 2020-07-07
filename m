Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 88592216D54
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 14:59:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-tVgUxCFuNperk90usVi8Wg-1; Tue, 07 Jul 2020 08:59:39 -0400
X-MC-Unique: tVgUxCFuNperk90usVi8Wg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1505A8015F3;
	Tue,  7 Jul 2020 12:59:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5F772E026;
	Tue,  7 Jul 2020 12:59:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25EEE1809547;
	Tue,  7 Jul 2020 12:59:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067CqPTe015985 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 08:52:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B759208DD95; Tue,  7 Jul 2020 12:52:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07458208DD94
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 12:52:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF16E108C26D
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 12:52:21 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-357-27FvQ9NFNXyskAKR60O20g-1;
	Tue, 07 Jul 2020 08:52:19 -0400
X-MC-Unique: 27FvQ9NFNXyskAKR60O20g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9B744AE8C;
	Tue,  7 Jul 2020 12:52:18 +0000 (UTC)
Message-ID: <143ec420092b5607e73a75f5c3f7a90d7186e7b1.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: "Schremmer, Steven" <Steve.Schremmer@netapp.com>, device-mapper
	development <dm-devel@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 07 Jul 2020 14:52:17 +0200
In-Reply-To: <DM6PR06MB52761D5DAA5DFA8B9AB23C268C690@DM6PR06MB5276.namprd06.prod.outlook.com>
References: <DM6PR06MB52761D5DAA5DFA8B9AB23C268C690@DM6PR06MB5276.namprd06.prod.outlook.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: add device to hwtable.c
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Steve,

On Mon, 2020-07-06 at 20:22 +0000, Schremmer, Steven wrote:
> From: Steve Schremmer <steve.schremmer@netapp.com>
> 
> Add FUJITSU ETERNUS_AHB defaults.
> 
> Signed-off-by: Steve Schremmer <steve.schremmer@netapp.com>
> ---
>  libmultipath/hwtable.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> index d1fcfdb3..d680bdfc 100644Insert

There's a patch format error     ^^^^^^ here in your mail.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


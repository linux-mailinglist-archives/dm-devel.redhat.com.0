Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E9A3125C812
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 19:29:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-EOjhNKanO7-PuZsE1axsfg-1; Thu, 03 Sep 2020 13:29:33 -0400
X-MC-Unique: EOjhNKanO7-PuZsE1axsfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D32D10BBECA;
	Thu,  3 Sep 2020 17:29:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD34A10013D7;
	Thu,  3 Sep 2020 17:29:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE10E1826D2B;
	Thu,  3 Sep 2020 17:29:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083HTJ0Q022789 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 13:29:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C4EC42166BA3; Thu,  3 Sep 2020 17:29:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83F302166BCC
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 17:29:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 398AB800CAF
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 17:29:17 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-537-kJAkpXJSPlKJU5UKFxtVDA-1;
	Thu, 03 Sep 2020 13:29:13 -0400
X-MC-Unique: kJAkpXJSPlKJU5UKFxtVDA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C32F3AFA0;
	Thu,  3 Sep 2020 17:29:12 +0000 (UTC)
Message-ID: <a8b50e520ec67accfedbec3ddb32493207a6234d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Thu, 03 Sep 2020 19:29:10 +0200
In-Reply-To: <a89192b4-f330-6a18-e4d7-e18305b1e66a@huawei.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<a89192b4-f330-6a18-e4d7-e18305b1e66a@huawei.com>
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
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 02/14] libmultipath: check malloc return
 value in, print_foreign_topology
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-02 at 15:16 +0800, lixiaokeng wrote:
> We check the return value of malloc in print_foreign_topology.
> 
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  libmultipath/foreign.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
> index e8f61351..44f32d03 100644
> --- a/libmultipath/foreign.c
> +++ b/libmultipath/foreign.c
> @@ -545,6 +545,10 @@ void print_foreign_topology(int verbosity)
>  	char *buf = NULL, *tmp = NULL;
> 
>  	buf = malloc(buflen);
> +	if (!buf) {
> +		condlog (0, "malloc buf failed.");
> +		return;
> +	}

Just replace the malloc() by calloc() please, and remove the buf[0]
initialization. No need for an error message.

Martin


>  	buf[0] = '\0';
>  	while (buf != NULL) {
>  		char *c = buf;
> --
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


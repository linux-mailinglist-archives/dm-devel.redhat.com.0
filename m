Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5479D1418D5
	for <lists+dm-devel@lfdr.de>; Sat, 18 Jan 2020 18:55:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579370154;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aSmpJy+5BfQn08JFUhuRgRHgGyYwH2nlScq6fQCJiTc=;
	b=JwIFssUPxn3QLlcAMj/9T+2u+WbVmgjc6KTh0fwpnDHNWfKAFuJCoONy1keXqmmY592UlS
	zzS4xJKIRwB4bZlBynTcUQs+mv1EjhjuJlOXFJLi1LfGHSrdtketrsFoBLJcyEM9KR3crd
	HDV2z39iu043ZFRfj1GqEO7EqkNnzzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-bODOTGNeM8eHgoGD_d2whw-1; Sat, 18 Jan 2020 12:55:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F756801E6C;
	Sat, 18 Jan 2020 17:55:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65DF560BEC;
	Sat, 18 Jan 2020 17:55:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C911F87095;
	Sat, 18 Jan 2020 17:55:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00IHtcNk021909 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 18 Jan 2020 12:55:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A1A72093CE3; Sat, 18 Jan 2020 17:55:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8577420292BF
	for <dm-devel@redhat.com>; Sat, 18 Jan 2020 17:55:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1538B802095
	for <dm-devel@redhat.com>; Sat, 18 Jan 2020 17:55:36 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-233-F_jjWcyAMFWSov_ll8XM2g-1;
	Sat, 18 Jan 2020 12:55:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 56C7A8EE2AB; 
	Sat, 18 Jan 2020 09:55:29 -0800 (PST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YHxP8T0xBaqT; Sat, 18 Jan 2020 09:55:29 -0800 (PST)
Received: from jarvis.lan (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B3D9F8EE17D;
	Sat, 18 Jan 2020 09:55:27 -0800 (PST)
Message-ID: <1579370126.3421.19.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Franck LENORMAND <franck.lenormand@nxp.com>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Date: Sat, 18 Jan 2020 09:55:26 -0800
In-Reply-To: <1551456599-10603-3-git-send-email-franck.lenormand@nxp.com>
References: <1551456599-10603-1-git-send-email-franck.lenormand@nxp.com>
	<1551456599-10603-3-git-send-email-franck.lenormand@nxp.com>
Mime-Version: 1.0
X-MC-Unique: F_jjWcyAMFWSov_ll8XM2g-1
X-MC-Unique: bODOTGNeM8eHgoGD_d2whw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00IHtcNk021909
X-loop: dm-devel@redhat.com
Cc: horia.geanta@nxp.com, snitzer@redhat.com, jmorris@namei.org,
	dhowells@redhat.com, dm-devel@redhat.com,
	silvano.dininno@nxp.com, agk@redhat.com, serge@hallyn.com
Subject: Re: [dm-devel] [RFC PATCH 2/2] dm-crypt: Use any key type which is
	registered
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2019-03-01 at 17:09 +0100, Franck LENORMAND wrote:
> @@ -2025,16 +2027,15 @@ static int crypt_set_keyring_key(struct
> crypt_config *cc, const char *key_string
>  	if (!key_desc || key_desc == key_string || !strlen(key_desc
> + 1))
>  		return -EINVAL;
>  
> -	if (strncmp(key_string, "logon:", key_desc - key_string + 1)
> &&
> -	    strncmp(key_string, "user:", key_desc - key_string + 1))
> -		return -EINVAL;
> +	type = get_key_type(key_string, key_desc - key_string);
> +	if (!type)
> +		return -ENOENT;

You can't do this.  This check ensures that the key responds correctly
to user_key_payload_locked() lower down.  To do that, the payload has
to be in a specific form.  You ensured that yours are, but dm-crypt
will now accept any key type, load the user payload blindly and create
all sorts of mayhem in the kernel because of the structural differences
in payload types.

James


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6A41B2F17
	for <lists+dm-devel@lfdr.de>; Tue, 21 Apr 2020 20:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587493721;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ROlKdeJB8c4x7Tr9pdxvpdRWKNMTAl3dx4yGHW/5JRU=;
	b=gZp/xlCh7ZlfTtEtYPetbgRhSWUDEfEK4Z491052VwvHagokOMoNPNzhVXIM3FbH3XjF4Y
	Uwim/1Bftw1wcNIxQyLBKNv+RSIqn/beMkJhCAYJpqF9LOV5iYSebxdVPiqeYoVFLpUWT+
	KN6rzz0MwZJ0Fcjl42E3jaAnCgFm/o8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-OELP9nrLOvGI36nyJHK6DA-1; Tue, 21 Apr 2020 14:28:37 -0400
X-MC-Unique: OELP9nrLOvGI36nyJHK6DA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 504C6DB60;
	Tue, 21 Apr 2020 18:28:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AEE35DA82;
	Tue, 21 Apr 2020 18:28:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 249D8941A3;
	Tue, 21 Apr 2020 18:28:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LIS3kj028107 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 14:28:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86D6C2166B27; Tue, 21 Apr 2020 18:28:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C4D2166B2A
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 18:27:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C48C800260
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 18:27:59 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-248-HVsfPIgyO762ot1kmsBeRA-1; Tue, 21 Apr 2020 14:27:56 -0400
X-MC-Unique: HVsfPIgyO762ot1kmsBeRA-1
Received: by mail-qk1-f175.google.com with SMTP id l78so15558151qke.7;
	Tue, 21 Apr 2020 11:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=q6OOUlKzKdkmKhxGisAVD4Ka4fvjkyM5jD37esaurMY=;
	b=qHQZJfD+PzwyA7jClaGX1qkDqSK704tc6eBwrIE5f80rJhq77sIRAL7QTwcRinRIFv
	yciuGGcygLv+XKnmDN0quNxjxd6PQDdmAwt+/qqwmU1UOKJT3ExCKW7wE8+8vu0Uo4Yu
	vKCL0+saKtbGqW7RloqcdJOuSZ9zcORfTAOheh/58k7hCxpdOsoR68RbXzlvWNgWe1pm
	/CfygghSXSyFt7rrf/fR+7g/jS0wWQ2SpW7mgApTglXbKb1OjpxawqNkFyu5QVMBzRjz
	3tUkRqM0GhLP9hiSXwEDC55BmNSZbzBDA8Zg19RiAcNZgB1b+NGGJ1tIUxF2+Yqv4JY3
	1uyQ==
X-Gm-Message-State: AGi0PuZyQlT+6Y/9R1/9ID6w1HozwKxCeYu4yzln4QaWh4vQssXsFspl
	1EqvYfLbKjmOngZ0zirVC7s=
X-Google-Smtp-Source: APiQypKRZufxCbXA4Wjcpe9euHxzB8RpUb+Fu1SFCpJRBYBBz2/wNpFZcS8wicJ+Mj6ZPJjLQMeyhg==
X-Received: by 2002:a37:a0d5:: with SMTP id
	j204mr22553668qke.112.1587493675614; 
	Tue, 21 Apr 2020 11:27:55 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id 70sm2276079qkh.67.2020.04.21.11.27.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Apr 2020 11:27:54 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:27:54 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Message-ID: <20200421182754.GA49104@lobo>
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200420134659.1640089-1-dbaryshkov@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03LIS3kj028107
X-loop: dm-devel@redhat.com
Cc: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-crypt: support using encrypted keys
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 20 2020 at  9:46P -0400,
Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:

> From: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
> 
> Allow one to use encrypted in addition to user and login key types for
> device encryption.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>

I fixed up some issues, please see the following incremental patch,
I'll get this folded in and staged for 5.8.

Mike

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 7056ab54d7dd..a0d9218d411b 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2272,10 +2272,10 @@ static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string
 
 	if (!strncmp(key_string, "logon:", key_desc - key_string + 1)) {
 		type = &key_type_logon;
-		set_key = &set_key_user;
+		set_key = set_key_user;
 	} else if (!strncmp(key_string, "user:", key_desc - key_string + 1)) {
 		type = &key_type_user;
-		set_key = &set_key_user;
+		set_key = set_key_user;
 	} else if (!strncmp(key_string, "encrypted:", key_desc - key_string + 1)) {
 		type = &key_type_encrypted;
 		set_key = set_key_encrypted;
@@ -2287,8 +2287,7 @@ static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string
 	if (!new_key_string)
 		return -ENOMEM;
 
-	key = request_key(type,
-			  key_desc + 1, NULL);
+	key = request_key(type, key_desc + 1, NULL);
 	if (IS_ERR(key)) {
 		kzfree(new_key_string);
 		return PTR_ERR(key);


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


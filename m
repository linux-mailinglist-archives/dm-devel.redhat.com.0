Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B8640EC9
	for <lists+dm-devel@lfdr.de>; Fri,  2 Dec 2022 20:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670010800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oWubP8TJ2xe3MRkOTmaf0SoydKRY3lSy7Trb7nDeNgE=;
	b=ZOKila94PGJwU60ryTpqwF6H/Galrn17m5JN+n/1K/EzE/9f7xFfMw3PlO4rkMSDMeXMew
	FiZw2oeO+2TA+kWrcUdhi6o+EXWcD6g94pniSGbnlXLGXjLbv28HBuGMkUlg7e0jqzuw3k
	VeLHB4bpg0mNIYKHvwU+B2C8HF+tlM0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-chc3HH4sNieRevAJx-uA3w-1; Fri, 02 Dec 2022 14:53:17 -0500
X-MC-Unique: chc3HH4sNieRevAJx-uA3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8233685A588;
	Fri,  2 Dec 2022 19:53:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 530D940CA40C;
	Fri,  2 Dec 2022 19:53:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B60F419465B9;
	Fri,  2 Dec 2022 19:53:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D07871946587
 for <dm-devel@listman.corp.redhat.com>; Fri,  2 Dec 2022 19:53:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B3F921401C3A; Fri,  2 Dec 2022 19:53:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABDCF1401C39
 for <dm-devel@redhat.com>; Fri,  2 Dec 2022 19:53:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 914373813F37
 for <dm-devel@redhat.com>; Fri,  2 Dec 2022 19:53:04 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-656-_hCX5N7wPsOFJH6oDzKSMg-1; Fri,
 02 Dec 2022 14:53:01 -0500
X-MC-Unique: _hCX5N7wPsOFJH6oDzKSMg-1
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 420EE21C77;
 Fri,  2 Dec 2022 19:52:59 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 13FF5133DE;
 Fri,  2 Dec 2022 19:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6o5AA5tXimP3AwAAGKfGzw
 (envelope-from <mwilck@suse.com>); Fri, 02 Dec 2022 19:52:59 +0000
Message-ID: <3854c5e9c90727ec4b0194f9abd09d99b0abc7c9.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 02 Dec 2022 20:52:58 +0100
In-Reply-To: <32a8240e11ad76fa6d2f4547916a81d594200b1a.camel@suse.com>
References: <20221109211007.389-1-mwilck@suse.com>
 <20221117185333.GT19568@octiron.msp.redhat.com>
 <32a8240e11ad76fa6d2f4547916a81d594200b1a.camel@suse.com>
User-Agent: Evolution 3.46.1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] [RFC PATCH] libmultipath: is_path_valid(): check if
 device is in use
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
Cc: fbui@suse.com, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-11-17 at 21:40 +0100, Martin Wilck wrote:
> >=20
> > > +=A0=A0=A0=A0=A0=A0=A0pthread_cleanup_push_cast(free_scandir_result, =
&sr);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* parts[0] is the whole disk */
> > > +=A0=A0=A0=A0=A0=A0=A0if (vector_alloc_slot(parts) &&
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (prop =3D strdup(strrchr(path, '/') +=
 1)) !=3D NULL)
> >=20
> > Since we always add 1, prop can never be NULL.
>=20
> Oops. I should rather check for prop !=3D ONE then :-)

... or rather not.=A0
The "+ 1" is inside the parentheses of the call to strdup().

Regards
Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


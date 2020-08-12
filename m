Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BCDE6242799
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 11:28:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-vKndObrBMZm5tBHUEHV5Ig-1; Wed, 12 Aug 2020 05:28:39 -0400
X-MC-Unique: vKndObrBMZm5tBHUEHV5Ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CCA181CAFA;
	Wed, 12 Aug 2020 09:28:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2A6719D7B;
	Wed, 12 Aug 2020 09:28:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E78DF97529;
	Wed, 12 Aug 2020 09:28:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07C9SNaY014768 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 05:28:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 790202026D69; Wed, 12 Aug 2020 09:28:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73D932026D5D
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 09:28:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BB55800962
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 09:28:20 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-415-JC5b7qFgPWq-8cISCsgRzA-1;
	Wed, 12 Aug 2020 05:28:18 -0400
X-MC-Unique: JC5b7qFgPWq-8cISCsgRzA-1
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-16-zBCKT64dO7yer4935RLlMA-1; Wed, 12 Aug 2020 11:28:15 +0200
X-MC-Unique: zBCKT64dO7yer4935RLlMA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB5388.eurprd04.prod.outlook.com (2603:10a6:10:82::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18;
	Wed, 12 Aug 2020 09:28:15 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3283.015;
	Wed, 12 Aug 2020 09:28:14 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 7/8] multipathd: unset mpp->hwe when removing map
Thread-Index: AQHWcCqfNmgIFcXwFUGd8pAJlHnpH6k0NXeA
Date: Wed, 12 Aug 2020 09:28:14 +0000
Message-ID: <6b8bb17983936f267f0b8ef05079dbac78e9e4fa.camel@suse.com>
References: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
	<1597183123-15797-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1597183123-15797-8-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e514e95-2725-4e8a-d21e-08d83ea20a31
x-ms-traffictypediagnostic: DB7PR04MB5388:
x-microsoft-antispam-prvs: <DB7PR04MB5388042387E560CE9E7BB77BFC420@DB7PR04MB5388.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jpoC9QUoeMEY04JcLwWUs7zUwmY79Pjy22UdAGv3lwNB4csY4pMI4Fqy5LuxVBHL2RW42xP2/Zz0+qFW9QQ0AVgCX69/61J//Kuj6ZfcHcUMKHRyeNtd05f88GlKIDa+3fBC6cXNd3AP1aU7g61dq+RSYe4NnCVfk8NJbZkCF249upKDBG/feaeXN8NI5dlwLqXBVvXiKA4ntlbw0FgevDExkB1m1/oEA2jtiQswfIiEkdd77AyoNt1wvVttl/sv7sujrsU1o6XdmG7aIFCtlbmZQC6EPsonxc/4LeZ5uQgwlpx9nLhgYE+XULwV2fpSCKeoxOUbWQ7bySh9RexgQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(396003)(136003)(39860400002)(366004)(376002)(346002)(186003)(66446008)(2616005)(36756003)(64756008)(316002)(5660300002)(478600001)(26005)(6506007)(2906002)(110136005)(8676002)(6512007)(8936002)(83380400001)(71200400001)(66574015)(76116006)(91956017)(86362001)(66476007)(6486002)(66556008)(4326008)(66946007);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: WvdxrrnwIlvc8KXYyF0nGIJPine+FGExxbuLRs07THwkq5scrNIegK1U8ifusPJk/0hEhNLqX6rnbSU3mxiUVGIvjvzJf4OZM/KrObjMCJQhlVQVjSnVoWA7Tis+LWEpwebGe2Krg/Ko1yduBoVE0oxzVW8ki/L7pNO1gJPWV/pny3ml47ETllyvmsmIxEvf8Bo567h36jBh1oKDBI4HiPIVdJNTLMUuzyJ1W4Qjfbd4kEgBMLBlqOkiedh8l5PE3kG0Am0lTYKXvSASLqp7rJqW+/P1c/WZCoI7QTcm3UWFa+DGoV7EUd7NnewMAXwfB+BPr8bdOqpDRfk7y8v9GJamRHAO1Dy4v70X31uJdvyG65HBPdjXrXmena+519wFXJFCz4OiYrztgfuhZywXWo3/LuBA/afKS1LkwDp9iXXK4QSwJ8+7K/94vU7bCZZKtkKbVpHYgYl0xeoo14mItJLYkfBKgsP25MDmAGgLrRR+wCHqf/nTYvK+Td8KVQ7GZd1yAhwtxPMRmIIu1noowBOP0v4QPCXfXBR5knPW7QuZNq769J+igglwQ1hTdVWvG7h+NFFBJGOFfS76iSpX8TZA0oWcCvkzntmyfjx9CDjY2gJcpUnNZAUinZI/9+1d2vtwoIy5l+vYvy8POjvloQ==
x-ms-exchange-transport-forked: True
Content-ID: <69A7897BE682994D8AF15688188A4F81@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e514e95-2725-4e8a-d21e-08d83ea20a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2020 09:28:14.7897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLn5QeSmTvbJsFbgU4+pk7fNAbrYHRcQfTP9nAn+BIIJoG6pPT8XmuLcMNSwqk2suVjH5s7c0MtbdkV/q3A8xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5388
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07C9SNaY014768
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 7/8] multipathd: unset mpp->hwe when
	removing map
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-08-11 at 16:58 -0500, Benjamin Marzinski wrote:
> If the map doesn't unset its hwe pointer before orphaning all the
> paths,
> multipathd will print a warning message in orphan_path() because of
> commit "libmultipath: warn if freeing path that holds mpp->hwe".
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Do you have a specific reason to put "mpp->hwe =3D NULL" in the *callers*
of orphan_paths()? I observed the same problem, and fixed it
directly in orphan_paths() (the patch is part of in my upcoming v2
series).

Regards,
Martin


> ---
>  libmultipath/structs_vec.c | 1 +
>  multipathd/main.c          | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index ede14297..103ea11e 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -129,6 +129,7 @@ remove_map(struct multipath * mpp, struct vectors
> * vecs, int purge_vec)
>  =09/*
>  =09 * clear references to this map
>  =09 */
> +=09mpp->hwe =3D NULL;
>  =09orphan_paths(vecs->pathvec, mpp, "map removed internally");
> =20
>  =09if (purge_vec &&
> diff --git a/multipathd/main.c b/multipathd/main.c
> index f014d2a1..2b0e2734 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -666,6 +666,7 @@ flush_map(struct multipath * mpp, struct vectors
> * vecs, int nopaths)
>  =09=09condlog(2, "%s: map flushed", mpp->alias);
>  =09}
> =20
> +=09mpp->hwe =3D NULL;
>  =09orphan_paths(vecs->pathvec, mpp, "map flushed");
>  =09remove_map_and_stop_waiter(mpp, vecs);
> =20

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


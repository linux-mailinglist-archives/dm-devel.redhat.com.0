Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1491E83A4
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 18:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590769692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Axsv8LZ3AESV4N37ZOd50Ac+VXJzV6560KtQ20l5h7s=;
	b=bO/BJWXavoro4/e/aNweF9hkqKuNOncDlZ/ZJQJl9eoIviY1Pz6hY0m+gO/l6ADFeaOsnW
	bnVVDsvRb4kEDrr4lmHyJ/k+MgWQbSnqBCQjqitIs0sjJ3DxmndzAspp8dj3aP+MMhgeiJ
	AmTY75EZeBecqE/uD9eRBPm781tp7YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-TQDA7FL1OvamivoiD6t20w-1; Fri, 29 May 2020 12:28:10 -0400
X-MC-Unique: TQDA7FL1OvamivoiD6t20w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77115461;
	Fri, 29 May 2020 16:28:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC866C792;
	Fri, 29 May 2020 16:28:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4E8C1809543;
	Fri, 29 May 2020 16:27:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TGR5QC028578 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 12:27:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70ADE2026971; Fri, 29 May 2020 16:27:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C43D2026E1C
	for <dm-devel@redhat.com>; Fri, 29 May 2020 16:27:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F05B8007A4
	for <dm-devel@redhat.com>; Fri, 29 May 2020 16:27:03 +0000 (UTC)
Received: from m4a0072g.houston.softwaregrp.com
	(m4a0072g.houston.softwaregrp.com [15.124.2.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-353-0a3QDxb3M6OrfWE_3VpcEw-1;
	Fri, 29 May 2020 12:27:00 -0400
X-MC-Unique: 0a3QDxb3M6OrfWE_3VpcEw-1
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 29 May 2020 16:25:48 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 29 May 2020 16:26:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 29 May 2020 16:26:43 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB1898.namprd18.prod.outlook.com (2603:10b6:4:6c::35)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19;
	Fri, 29 May 2020 16:26:42 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.3045.018;
	Fri, 29 May 2020 16:26:42 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 1/1] libdmmp: Add support for upcoming json-c
	0.14.0.
Thread-Index: AQHWNW8tLlj2iB8F6U6GsOimwkeg/qi+x64AgAB3coCAAAHeAA==
Date: Fri, 29 May 2020 16:26:42 +0000
Message-ID: <5c7bfb7d67bc43c629bf4af1b6e7a41b3ae3bfba.camel@suse.com>
References: <1590725443-3519-1-git-send-email-bmarzins@redhat.com>
	<1590725443-3519-2-git-send-email-bmarzins@redhat.com>
	<d092428a245e0b5d88b70f03a473d7df7b95cd27.camel@suse.com>
	<20200529161959.GF5907@octiron.msp.redhat.com>
In-Reply-To: <20200529161959.GF5907@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 811b8ff9-c0f7-46f5-67c5-08d803ed1268
x-ms-traffictypediagnostic: DM5PR1801MB1898:
x-microsoft-antispam-prvs: <DM5PR1801MB18988B4A67D5B5F46823AF1FFC8F0@DM5PR1801MB1898.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3yjSHEY3ZjM4XQsSUFgryLXVtFfTbym1FaF6umww38NzrY0Gn5gcQCwuaTp1Zw3EoumvyS9PoB5IqKzGjU2zaqeU2emcXk2xKzpdesPSz7R7tftC23shD31RF+yL5OYXAaQlyCHoNmpUZbuXW2XdAhpHl8kfjUhfl9kiNFequGQ1Cmjvkz4zlswVjUq3xVhlSzecuYegZlejUqNjtaiMe11m2OhmYgOR09JD8RwMjMCvCm6SZl7NN0Ho35DuOZGe3y8KbXrS8d9TJlQ07JoURGRVayZlp7mNEy/T/ym4JeJ8xLyXCVnMiV8p7FMKX3a+kIur7X8rmMqdjthySCbHpagNmCZasGV3T6QZuzq+6dELryLNnCwz5yci8GoGwMRizGsKdPxiYGMsAmmDFSEznw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(4326008)(66556008)(91956017)(54906003)(76116006)(316002)(64756008)(66446008)(6506007)(8936002)(6916009)(6512007)(8676002)(2616005)(186003)(66946007)(66476007)(966005)(26005)(2906002)(478600001)(6486002)(5660300002)(36756003)(86362001)(71200400001)(4744005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: kgYp3YZaYxbHRQUHFcLMgvKkSTp9NLh7an3p+Oi8sD0GHK/BM5wzVs7HgROWUuOir6RiItgKahrg1yIhLSj6dHHDWCc2eJha+VzQtVCozkqiUidqeEE117qaBN8GmXWA4DejW8xjrxo/U21n6MShK8a1wZ88Nxs59wNBut6smvWfO3LcEXRy5z2jCBlhwtuUPcfVtWbWWodinkENgu8l1UIx+i/gZb/0Fu/d76KwoUsVdJpLCYjONEIu6lLImJLPGmVj+2tHH/8W49hldP5V6Q9ZiQ5jDeBksf7P9yIvZTkF6l1gpYPlL70UxbwA4wFU9+QztJ68ojSRNsNPwkCnYS4VolHoREJTcI+nx6fKT3gItKZKE3f/8axOxSsCv7LzQ5IZKN1rBlK0EB3l82jguQuZZDZoNN4QVLJclUKRfTGeOCw7dM8UxPDMKNZ4vUMzT7iun5ypXuJ3efMfZVyCNd5Qol+0BjHoHz9rTy7HySc=
x-ms-exchange-transport-forked: True
Content-ID: <0DD86C87C624A64490682F2E69E46B3F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 811b8ff9-c0f7-46f5-67c5-08d803ed1268
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 16:26:42.2891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xr6TbsHlWGEbTGuUYjhTdxu1DemkfDZgn9/Dx6iXp6YEpLuSgtSRV/6lCW1aQzojk4YHMbPg6RCveGLPYF50VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1898
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04TGR5QC028578
X-loop: dm-devel@redhat.com
Cc: "mail@eworm.de" <mail@eworm.de>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"xose.vazquez@gmail.com" <xose.vazquez@gmail.com>,
	"besser82@fedoraproject.org" <besser82@fedoraproject.org>
Subject: Re: [dm-devel] [PATCH 1/1] libdmmp: Add support for upcoming json-c
 0.14.0.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-05-29 at 11:19 -0500, Benjamin Marzinski wrote:
> On Fri, May 29, 2020 at 09:12:30AM +0000, Martin Wilck wrote:
> >=20
> > Did you see=20
> > https://www.redhat.com/archives/dm-devel/2020-May/msg00261.html ?
>=20
> Nope. Overlooked it. My bad. I'm fine with any version that compiles.
> Either stdbool or int is fine.

Ok. I'll take the liberty to apply mine on my upstream-queue branch,
then. Let Christophe have the final say when he merges next time.

Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


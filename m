Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 287321FFC9D
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 22:39:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592512749;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UMhhHPi5bwFu/HLgEqPZvGVtXYqCnY1XcJSPq597W1g=;
	b=HE/e6cmZzCA9hBcGniSmBe41peMGr/S0okpTYQXylVx+nud7TphHE0re4t5/DlFJCi8uc3
	ehVkXo8+03edw4gUEH9OGSoaUjMA0lKh6QJvcpVCUVh6Djv4dF/T1/RxZzqHl1gsEgBCC0
	0OOM5sw/MDaPg7hRRrgsjYprMzLBj7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-cLQe-sgyMp-6EGMtSMForw-1; Thu, 18 Jun 2020 16:39:06 -0400
X-MC-Unique: cLQe-sgyMp-6EGMtSMForw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B5AC108C30B;
	Thu, 18 Jun 2020 20:39:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CD2560F80;
	Thu, 18 Jun 2020 20:39:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E30D5833C1;
	Thu, 18 Jun 2020 20:38:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IKcsAc030083 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 16:38:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D50DE1055522; Thu, 18 Jun 2020 20:38:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB941055515
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:38:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDFA2185A797
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:38:52 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-8v1vsHQjMlmAfvQDovNNgA-1; Thu, 18 Jun 2020 16:38:48 -0400
X-MC-Unique: 8v1vsHQjMlmAfvQDovNNgA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB5881.eurprd04.prod.outlook.com (2603:10a6:10:a7::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19;
	Thu, 18 Jun 2020 20:38:47 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Thu, 18 Jun 2020 20:38:47 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 5/7] multipath: make flushing maps work like other
	commands
Thread-Index: AQHWRQbdo2eLR+iaQUKb0lyoRipbHKje1t8A
Date: Thu, 18 Jun 2020 20:38:46 +0000
Message-ID: <bffcf533c947830e4bc83cec575bb74fa3615d5e.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-6-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d89f1db-577f-4b5b-67f8-08d813c799a6
x-ms-traffictypediagnostic: DB8PR04MB5881:
x-microsoft-antispam-prvs: <DB8PR04MB58819DC424CAFE80D77806B4FC9B0@DB8PR04MB5881.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MGsF+pOpJShLZMQ76CfgC2URFN/IERsVHSA+hO1LJ8QEJ4vT57P6/8K7zJZ/vpRK2MJVhYcWoX1hUZiATuO1YPIR+jysCOuu3zl4d36K3x8Q6fKlw3HvboXOvnUayUG8BUJG8rFaBtefySsPSGHmf8pFo48w25kUWv1TV9FJk8VZw0aOeV2qmfsWr1p3buQalNOQMnixhd+BIE2eZ2Sf2roC+jMvsgSXjn+c9zxab50Z19Dg+6coyl8EETf7uJ6CXYr3J1nNh9xrOzqxIWCYneKQYlBp9hK2PEs7mMc46xNfHWjlxRA/SJbfvGbcbrTlKCjKfFgR4ix29Fm5euEnEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(366004)(39860400002)(376002)(136003)(346002)(396003)(316002)(508600001)(4326008)(76116006)(8676002)(66446008)(2616005)(4744005)(6506007)(6486002)(91956017)(6512007)(66556008)(36756003)(110136005)(66476007)(66946007)(64756008)(8936002)(5660300002)(186003)(2906002)(86362001)(26005)(71200400001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: 5FDt0Py3NNXDFn9xJ3Fb2RALRM+2zsIAvzwyw6ZcE5Ii1i706LPTuV2UH+0XeNY9MsDejkxZvqL3OSxRDcBNPwJNqQ8RfK5jsNGF+KrxuVFTv6RZDQlUQfYAyWE4ewMEi6MvI+c3YWDNeUJ4C8cb3bdPwIXlJS/Fc8mvrYjVVIjzKSKsGvhT1WQx9QczfKD+F62B2W0pvlWE7EtwF91t0+mgG8d3ZlEcyxPD+4vB9ulfBYF2jiRUAgz5f7uQD+X/Xb7q3cUSycbe9VkbCy7z+R/10enPVsy5/1CNUNoZsc60eGDkm+sRxpYT1KaTeH0oQqa4NTOinqzlLRjGNT4OZ9ZzbpCBt1C/Ds2wvlDy2aj/7oFNbIlAvFE4lI/fMTnWA/A2w/ii+LCOcxDH0iG486T9V0hJ+F5Sbu5YFCN10DrdaYh4SZy7FIJTlf1iD9h30Yd1wnE/kQFUgK9jPc4++r+04RiCKAt3rwZRJ5R+4oY=
x-ms-exchange-transport-forked: True
Content-ID: <CE3AEBBA311FCE44875DDB740548CAB2@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d89f1db-577f-4b5b-67f8-08d813c799a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 20:38:46.9434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v+bgcQugW9gCIxK1L07pGdlrR6Fh7PyReHTVJfIfFBVLbZMYXUiuGdF/hOMu2+IO40B0jV5IX1hKqOIJ0KPIpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5881
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IKcsAc030083
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 5/7] multipath: make flushing maps work like
 other commands
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> The config structure doesn't need a special variable just for
> removes.
> Multipath can just use the cmd variable, like it does for the other
> commands.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

